import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:jesusandme/features/daily_meditation/presentation/pages/first_page.dart';
import 'package:jesusandme/features/daily_meditation/presentation/pages/login_page.dart';

import '../../features/daily_meditation/presentation/bloc/auth/auth_bloc.dart';
import '../../features/daily_meditation/presentation/bloc/auth/auth_event.dart';
import '../../features/daily_meditation/presentation/bloc/tts/ttsCubit.dart';
import '../../features/daily_meditation/presentation/pages/home.dart';
import '../../features/daily_meditation/presentation/pages/home_page.dart';
import '../../features/daily_meditation/presentation/pages/lecture_page.dart';
import '../../features/daily_meditation/presentation/pages/plan_description_page.dart';
import '../../injection_container.dart';
class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(
            MultiBlocProvider(
                providers: [
                  BlocProvider<AuthBloc>(create: (_) => sl()..add(SplashScreen()),),
                  BlocProvider<TtsCubit>(create: (_) => TtsCubit(FlutterTts())),
                ],
                child: const Home()
            ));

      case '/first':
        return _materialRoute(FirstPage());

      case '/login':
        return _materialRoute(const LoginPage());

      case '/planDescription':
        return _materialRoute(PlanDescriptionPage(backgroundColor: settings.arguments as Color, description: settings.arguments as String,));

      case '/lecture':
        return _materialRoute(LecturePage(backgroundColor: settings.arguments as Color, title: settings.arguments as String, content: settings.arguments as String, verse: settings.arguments as String,));

      default:
        return _materialRoute(const HomePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}