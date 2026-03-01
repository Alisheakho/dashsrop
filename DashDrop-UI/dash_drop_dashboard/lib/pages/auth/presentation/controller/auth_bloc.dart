import 'dart:async';

import 'package:dash_drop_dashboard/pages/auth/domain/usecase/logout.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecase/login.dart';
import '../../domain/usecase/get_user.dart';
import '../../domain/usecase/reset_password.dart';
import '../../domain/usecase/is_authorized.dart';

part 'auth_events.dart';
part 'auth_states.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetUserUseCase getUserUseCase;
  final LoginUseCase loginUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final IsAuthorizedUseCase isAuthorizedUseCase;
  final LogoutUseCase logoutUseCase;

  AuthBloc(this.getUserUseCase, this.loginUseCase, this.resetPasswordUseCase,
      this.isAuthorizedUseCase, this.logoutUseCase)
      : super(const AuthState()) {
    on<GetUserEvent>(_getUserHandler);
    on<LoginEvent>(_loginHandler);
    on<ResetPasswordEvent>(_resetPasswordHandler);
    on<IsAuthorizedEvent>(_isAuthorizedHandler);
    on<LogoutEvent>(_logoutHandler);
  }

  FutureOr<void> _getUserHandler(
      GetUserEvent event, Emitter<AuthState> emit) async {
    final result = await getUserUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            getUserMessage: l.message, getUserState: RequestState.error)),
        (r) => emit(
            state.copyWith(getUser: r, getUserState: RequestState.loaded)));
  }

  FutureOr<void> _loginHandler(
      LoginEvent event, Emitter<AuthState> emit) async {
    final result = await loginUseCase(
        LoginParameters(userID: event.userID, password: event.password));
    result.fold(
        (l) => emit(state.copyWith(
            loginMessage: l.message, loginState: RequestState.error)),
        (_) => emit(
            state.copyWith(loginState: RequestState.loaded))); //createUser: r,
  }

  FutureOr<void> _resetPasswordHandler(
      ResetPasswordEvent event, Emitter<AuthState> emit) async {
    final result = await resetPasswordUseCase(ResetPasswordParameters(
        userID: event.userID,
        oldPassword: event.oldPassword,
        newPassword: event.newPassword));
    result.fold(
        (l) => emit(state.copyWith(
            resetPasswordMessage: l.message,
            resetPasswordState: RequestState.error)),
        (_) => emit(state.copyWith(
            resetPasswordState: RequestState.loaded))); //createUser: r,
  }

  FutureOr<void> _isAuthorizedHandler(
      IsAuthorizedEvent event, Emitter<AuthState> emit) async {
    final result = await isAuthorizedUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            isAuthorizedMessage: l.message,
            isAuthorizedState: RequestState.error,
            isAuthorized: false)),
        (r) => emit(state.copyWith(
            isAuthorized: r,
            isAuthorizedState: RequestState.loaded))); //createUser: r,
  }

  FutureOr<void> _logoutHandler(
      LogoutEvent event, Emitter<AuthState> emit) async {
    final result = await logoutUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            logoutMessage: l.message, logoutState: RequestState.error)),
        (_) => emit(state.copyWith(
            isAuthorized: false,
            logoutState: RequestState.loaded))); //createUser: r,
  }
}
