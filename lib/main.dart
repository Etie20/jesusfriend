import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/auth/auth_bloc.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/auth/auth_event.dart';
import 'config/routes/routes.dart';
import 'features/daily_meditation/presentation/bloc/tts/ttsCubit.dart';
import 'features/daily_meditation/presentation/pages/home.dart';
import 'injection_container.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => sl()..add(SplashScreen()),),
        BlocProvider<TtsCubit>(create: (_) => TtsCubit(FlutterTts())),
      ],
        child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const Home()
        )
    );


  }
}
