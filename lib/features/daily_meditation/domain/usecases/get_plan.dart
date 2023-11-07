import 'package:jesusandme/core/resources/data_state.dart';
import 'package:jesusandme/core/usecase/usecase.dart';
import 'package:jesusandme/features/daily_meditation/domain/entities/plan.dart';
import 'package:jesusandme/features/daily_meditation/domain/repository/plan_repository.dart';

class GetPlanUseCase implements UseCase<DataState<List<PlanEntity>>, void>{

  final PlanRepository _planRepository;

  GetPlanUseCase(this._planRepository);

  @override
  Future<DataState<List<PlanEntity>>> call({void params}) {
    return _planRepository.getDailyPlans();
  }

}