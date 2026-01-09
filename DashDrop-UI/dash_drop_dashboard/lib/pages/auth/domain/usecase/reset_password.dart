// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/auth/domain/repository/base_auth_repository.dart';

class ResetPasswordUseCase extends BaseUseCase<void, ResetPasswordParameters> {
  ResetPasswordUseCase(this.authRepository);

  final BaseAuthRepository authRepository;

  @override
  ResultVoid call(ResetPasswordParameters parameters) async =>
      authRepository.resetPassword(
          userID: parameters.userID,
          oldPassword: parameters.oldPassword,
          newPassword: parameters.newPassword);
}

class ResetPasswordParameters extends Equatable {
  final String userID;
  final String oldPassword;
  final String newPassword;

  const ResetPasswordParameters({
    required this.userID,
    required this.oldPassword,
    required this.newPassword,
  });

  @override
  List<Object> get props {
    return [userID, oldPassword, newPassword];
  }
}
