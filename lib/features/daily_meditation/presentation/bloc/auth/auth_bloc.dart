import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jesusandme/features/daily_meditation/domain/usecases/openApp.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/auth/auth_event.dart';
import '../../../domain/usecases/login.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final OpenAppUseCase _openAppUseCase;
  final LoginUseCase _loginUseCase;

  AuthBloc(this._openAppUseCase, this._loginUseCase): super(AuthInitial()){
    on <SplashScreen> (onSplashScreen);
    on <LoginPressed> (onLoginPressed);
  }

  void onSplashScreen(SplashScreen event, Emitter < AuthState > emit) async {
    try {
      final isLoggedIn = await _openAppUseCase();
      (isLoggedIn)?emit(AuthSuccess()):emit(AuthUnauthenticated());
    } catch(e) {
      emit(AuthError());
    }
  }

  void onLoginPressed(LoginPressed event, Emitter < AuthState > emit) async {
    try {
      emit(AuthLoading());
      await _loginUseCase(params: event.email);
      emit(AuthSuccess());
    } catch(e) {
      emit(AuthError());
    }
  }

}