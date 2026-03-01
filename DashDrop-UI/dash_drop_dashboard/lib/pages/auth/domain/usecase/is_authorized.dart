import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/auth/domain/repository/base_auth_repository.dart';

class IsAuthorizedUseCase extends BaseUseCase<bool, NoParameters> {
  IsAuthorizedUseCase(this.authRepository);

  final BaseAuthRepository authRepository;

  @override
  ResultFuture<bool> call(NoParameters parameters) async {
    return await authRepository.isAuthorized();
  }
}
