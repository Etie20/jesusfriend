import 'package:get_it/get_it.dart';
import 'package:jesusandme/features/daily_meditation/data/data_sources/auth_service.dart';
import 'package:jesusandme/features/daily_meditation/data/repository/auth_repository_impl.dart';
import 'package:jesusandme/features/daily_meditation/domain/repository/auth_repository.dart';
import 'package:jesusandme/features/daily_meditation/domain/usecases/get_daily_content.dart';
import 'package:jesusandme/features/daily_meditation/domain/usecases/login.dart';
import 'package:jesusandme/features/daily_meditation/domain/usecases/openApp.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/auth/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/daily_meditation/data/data_sources/daily_meditation_service.dart';
import 'features/daily_meditation/data/repository/plan_repository_impl.dart';
import 'features/daily_meditation/domain/repository/plan_repository.dart';
import 'features/daily_meditation/domain/usecases/get_plan.dart';
import 'features/daily_meditation/presentation/bloc/plan/plan_bloc.dart';

final sl = GetIt.instance;

Future<void>  initializeDependencies() async {

  //Supabase
  sl.registerSingleton<SupabaseClient>(
      Supabase.instance.client
  );

  //Services
  sl.registerSingleton<DailyPlansService>(DailyPlansService(sl()));

  sl.registerSingleton<AuthService>(AuthService(sl()));
  
  //Repositories
  sl.registerSingleton<PlanRepository>(
    PlanRepositoryImpl(sl())
  );
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(sl())
  );

  //UseCases
  sl.registerSingleton<GetPlanUseCase>(
    GetPlanUseCase(sl())
  );
  sl.registerSingleton<GetDailyContentUseCase>(
    GetDailyContentUseCase(sl())
  );

  sl.registerSingleton<OpenAppUseCase>(
    OpenAppUseCase(sl())
  );
  sl.registerSingleton<LoginUseCase>(
    LoginUseCase(sl())
  );

  //Blocs
  sl.registerFactory<PlansBloc>(
      () => PlansBloc(sl(), sl())
  );
  sl.registerFactory<AuthBloc>(
          () => AuthBloc(sl(), sl())
  );


}