import 'package:dash_drop/core/usecase/base_usecase.dart';
import 'package:dash_drop/core/utils/typedef.dart';
import 'package:dash_drop/pages/authentication/domain/repository/base_auth_repository.dart';

class LogoutUseCase extends BaseUseCase<void, NoParameters> {
  LogoutUseCase(this.authRepository);

  final BaseAuthRepository authRepository;

  @override
  ResultFuture<void> call(NoParameters parameters) async {
    return await authRepository.logout();
  }
}