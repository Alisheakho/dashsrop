part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class GetUserEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}

class IsAuthorizedEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final String userID;
  final String password;

  const LoginEvent({
    required this.userID,
    required this.password,
  });

  @override
  List<Object?> get props => [userID, password];
}

class ResetPasswordEvent extends AuthEvent {
  final String userID;
  final String oldPassword;
  final String newPassword;

  const ResetPasswordEvent({
    required this.userID,
    required this.oldPassword,
    required this.newPassword,
  });

  @override
  List<Object> get props {
    return [userID, oldPassword, newPassword];
  }
}
