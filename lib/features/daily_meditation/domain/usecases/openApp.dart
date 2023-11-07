import 'package:jesusandme/core/usecase/usecase.dart';
import 'package:jesusandme/features/daily_meditation/domain/repository/auth_repository.dart';

class OpenAppUseCase extends UseCase<bool, void> {

  final AuthRepository _authRepository;

  OpenAppUseCase(this._authRepository);

  @override
  Future<bool> call({void params}) {
    return _authRepository.isLoggedIn();
  }

}