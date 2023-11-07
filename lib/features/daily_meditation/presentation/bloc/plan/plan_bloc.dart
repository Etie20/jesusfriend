import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jesusandme/core/resources/data_state.dart';
import 'package:jesusandme/features/daily_meditation/domain/usecases/get_plan.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/plan/plan_event.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/plan/plan_state.dart';

import '../../../domain/usecases/get_daily_content.dart';

class PlansBloc extends Bloc<PlansEvent, PlansState> {
  final GetPlanUseCase _getPlanUseCase;
  final GetDailyContentUseCase _getDailyContentUseCase;

  PlansBloc(this._getPlanUseCase, this._getDailyContentUseCase) : super (const PlansLoading()) {
    on <GetPlans> (onGetPlans);
    on <GetDailyContent> (onGetDailyContent);
  }


  void onGetPlans(GetPlans event, Emitter < PlansState > emit) async {
    final dataState = await _getPlanUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit (
        PlansLoaded(plans: dataState.data!)
      );
    }

    if (dataState is DataFailed) {
      emit(
        PlansError(error: dataState.error!)
      );
    }
  }

  void onGetDailyContent(GetDailyContent event, Emitter < PlansState > emit) async {
    final dataState = await _getDailyContentUseCase(params: event.planId);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit (
        DailyContentLoaded(dailyContent: dataState.data)
      );
    }

    if(dataState is DataFailed) {
      emit(
        PlansError(error: dataState.error!)
      );
    }
  }

}