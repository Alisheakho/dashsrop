import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/auth/domain/entities/user.dart';
import 'package:dash_drop_dashboard/pages/auth/domain/repository/base_auth_repository.dart';

class GetUserUseCase extends BaseUseCase<User, NoParameters> {
  GetUserUseCase(this.authRepository);

  final BaseAuthRepository authRepository;

  @override
  ResultFuture<User> call(NoParameters parameters) async {
    return await authRepository.getUser();
  }
}
