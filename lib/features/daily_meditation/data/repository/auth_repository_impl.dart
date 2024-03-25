import 'package:jesusandme/features/daily_meditation/data/data_sources/auth_service.dart';
import 'package:jesusandme/features/daily_meditation/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  const AuthRepositoryImpl(this._authService);

  @override
  Future<void> signIn(email) async {
    await _authService.signIn(email);
  }

  @override
  Future<void> signOut() async{
    await _authService.logOut();
    throw UnimplementedError();
  }

  @override
  Future<void> updateProfile() async{
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

  @override
  Future<bool> isLoggedIn() async {
    return await _authService.isLoggedIn();
  }

  @override
  Future<void> verifyOtp(String username, String email, String otp) async {
    // TODO: implement verifyOtp
    await _authService.verifyOTP(username, email, otp);
    throw UnimplementedError();
  }
}