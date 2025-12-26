import 'package:dash_drop/core/usecase/base_usecase.dart';
import 'package:dash_drop/core/utils/typedef.dart';
import 'package:dash_drop/pages/authentication/domain/entities/user.dart';
import 'package:dash_drop/pages/authentication/domain/repository/base_auth_repository.dart';

class GetUserUseCase extends BaseUseCase<User, NoParameters> {
  GetUserUseCase(this.authRepository);

  final BaseAuthRepository authRepository;

  @override
  ResultFuture<User> call(NoParameters parameters) async {
    return await authRepository.getUser();
  }
}
