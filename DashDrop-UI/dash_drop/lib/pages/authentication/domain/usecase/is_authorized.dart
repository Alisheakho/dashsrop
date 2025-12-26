import 'package:dash_drop/core/usecase/base_usecase.dart';
import 'package:dash_drop/core/utils/typedef.dart';
import 'package:dash_drop/pages/authentication/domain/repository/base_auth_repository.dart';

class IsAuthorizedUseCase extends BaseUseCase<bool, NoParameters> {
  IsAuthorizedUseCase(this.authRepository);

  final BaseAuthRepository authRepository;

  @override
  ResultFuture<bool> call(NoParameters parameters) async {
    return await authRepository.isAuthorized();
  }
}
