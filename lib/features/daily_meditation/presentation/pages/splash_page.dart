import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/auth/auth_state.dart' as Astate;
import 'package:jesusandme/features/daily_meditation/presentation/pages/home.dart';
import 'package:lottie/lottie.dart';

import '../../data/user_preferences.dart';
import '../bloc/auth/auth_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AuthBloc, Astate.AuthState>(
        builder: (_, state) {
          if( state is Astate.AuthSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___) => const Home()));
            });
          }
          if( state is Astate.AuthUnauthenticated) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(context, '/first');
            });
          }
          return Scaffold(
            backgroundColor: UserPreferences().orange,
            body: Center(child: Lottie.asset("assets/lottie/animation_lnk1bi9h.json"),)
          );
        }
    );

  }

}