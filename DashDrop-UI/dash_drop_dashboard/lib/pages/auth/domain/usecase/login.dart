import 'package:equatable/equatable.dart';
import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/auth/domain/repository/base_auth_repository.dart';

class LoginUseCase extends BaseUseCase<void, LoginParameters> {
  LoginUseCase(this.authRepository);

  final BaseAuthRepository authRepository;

  @override
  ResultVoid call(LoginParameters parameters) async => authRepository
      .login(email: parameters.email, password: parameters.password);
}

class LoginParameters extends Equatable {
  const LoginParameters({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
