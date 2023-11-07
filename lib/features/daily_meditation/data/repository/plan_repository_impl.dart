import 'package:jesusandme/core/resources/data_state.dart';
import 'package:jesusandme/features/daily_meditation/data/data_sources/daily_meditation_service.dart';
import 'package:jesusandme/features/daily_meditation/data/models/daily_content.dart';
import 'package:jesusandme/features/daily_meditation/data/models/plan.dart';
import 'package:jesusandme/features/daily_meditation/domain/repository/plan_repository.dart';


class PlanRepositoryImpl implements PlanRepository {
  final DailyPlansService _dailyPlansService;

  const PlanRepositoryImpl(this._dailyPlansService);

  @override
  Future<DataState<List<PlanModel>>> getDailyPlans() async {
    try {
      final response = await _dailyPlansService.getPlans();
      return DataSuccess(response);
    } catch(e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<DailyContentModel>> getDailyContent(int planId) async {
    try {
      final response = await _dailyPlansService.getDailyContent(planId);
      return DataSuccess(response);
    } catch(e) {
      return DataFailed(e.toString());
    }
  }


}