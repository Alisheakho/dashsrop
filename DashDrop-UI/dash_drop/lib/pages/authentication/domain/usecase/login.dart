import 'package:equatable/equatable.dart';
import 'package:dash_drop/core/usecase/base_usecase.dart';
import 'package:dash_drop/core/utils/typedef.dart';
import 'package:dash_drop/pages/authentication/domain/repository/base_auth_repository.dart';

class LoginUseCase extends BaseUseCase<void, LoginParameters> {
  LoginUseCase(this.authRepository);

  final BaseAuthRepository authRepository;

  @override
  ResultVoid call(LoginParameters parameters) async => authRepository.login(
    userID: parameters.userID,
    password: parameters.password,
  );
}

class LoginParameters extends Equatable {
  const LoginParameters({required this.userID, required this.password});

  final String userID;
  final String password;

  @override
  List<Object?> get props => [userID, password];
}
