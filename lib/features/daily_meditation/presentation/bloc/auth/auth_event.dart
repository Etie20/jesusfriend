import 'package:equatable/equatable.dart';

class AuthEvent extends Equatable {

  const AuthEvent();

  @override
  List<Object> get props => [];
}

class UpdateEmail extends AuthEvent {
  final String email;

  const UpdateEmail({required this.email});

  @override
  List<Object> get props => [email];
}

class LoginPressed extends AuthEvent {
  final String email;

  const LoginPressed({required this.email});

  @override
  List<Object> get props => [email];
}

class LoginWithGooglePressed extends AuthEvent {}

class SplashScreen extends AuthEvent {}