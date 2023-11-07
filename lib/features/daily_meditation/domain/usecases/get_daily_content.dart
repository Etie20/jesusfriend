import 'package:jesusandme/core/usecase/usecase.dart';
import 'package:jesusandme/features/daily_meditation/domain/entities/daily_content.dart';
import 'package:jesusandme/features/daily_meditation/domain/repository/plan_repository.dart';

import '../../../../core/resources/data_state.dart';

class GetDailyContentUseCase extends UseCase<DataState<DailyContentEntity>, int> {

  final PlanRepository _planRepository;

  GetDailyContentUseCase(this._planRepository);

  @override
  Future<DataState<DailyContentEntity>> call({int? params}) {
    return _planRepository.getDailyContent(params!);
  }

}