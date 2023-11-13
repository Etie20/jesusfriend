import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/tts/ttsCubit.dart';
import 'package:jesusandme/features/daily_meditation/presentation/pages/first_page.dart';
import 'package:jesusandme/features/daily_meditation/presentation/pages/splash_page.dart';

import '../../../../injection_container.dart';
import '../bloc/cubit/colorCubit.dart';
import '../bloc/plan/plan_bloc.dart';
import '../bloc/plan/plan_event.dart';
import 'home_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PlansBloc>(create: (_) => sl()..add(const GetPlans())),
        BlocProvider<ColorCubit>(create: (_) => ColorCubit())
      ],
      child: const SplashPage()
      //FirstPage()
      //HomePage(),
    );
  }

}