import 'package:jesusandme/core/usecase/usecase.dart';
import 'package:jesusandme/features/daily_meditation/domain/repository/auth_repository.dart';

class LoginUseCase implements UseCase<void, String> {

  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  @override
  Future<void> call({String? params}) {
    return _authRepository.signIn(params!);
  }
}