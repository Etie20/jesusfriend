import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/plan/plan_bloc.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/plan/plan_event.dart';
import 'package:jesusandme/features/daily_meditation/presentation/pages/plan_description_page.dart';

import '../../../../injection_container.dart';

class PlanDescription extends StatelessWidget {
  final int planId;
  final Color backgroundColor;
  final String description;
  const PlanDescription({super.key, required this.planId, required this.backgroundColor, required this.description});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlansBloc>(
        create: (_) => sl()..add(GetDailyContent(planId: planId)),
      child: PlanDescriptionPage(backgroundColor: backgroundColor, description: description,),
    );
  }

}