part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final User getUser;
  final RequestState getUserState;
  final String getUserMessage;

  final RequestState loginState;
  final String loginMessage;

  final RequestState resetPasswordState;
  final String resetPasswordMessage;

  final bool isAuthorized;
  final RequestState isAuthorizedState;
  final String isAuthorizedMessage;

  final RequestState logoutState;
  final String logoutMessage;

  const AuthState(
      {this.getUser = const User(
          id: -1, name: '', role: '', text: '', title: '', dateofbirth: ''),
      this.getUserState = RequestState.loading,
      this.getUserMessage = '',
      this.loginState = RequestState.loading,
      this.loginMessage = '',
      this.resetPasswordState = RequestState.loading,
      this.resetPasswordMessage = '',
      this.isAuthorized = false,
      this.isAuthorizedState = RequestState.loading,
      this.isAuthorizedMessage = '',
      this.logoutState = RequestState.loading,
      this.logoutMessage = ''});

  AuthState copyWith({
    User? getUser,
    RequestState? getUserState,
    String? getUserMessage,
    RequestState? loginState,
    String? loginMessage,
    RequestState? resetPasswordState,
    String? resetPasswordMessage,
    bool? isAuthorized,
    RequestState? isAuthorizedState,
    String? isAuthorizedMessage,
    RequestState? logoutState,
    String? logoutMessage,
  }) {
    return AuthState(
      getUser: getUser ?? this.getUser,
      getUserState: getUserState ?? this.getUserState,
      getUserMessage: getUserMessage ?? this.getUserMessage,
      loginState: loginState ?? this.loginState,
      loginMessage: loginMessage ?? this.loginMessage,
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
      resetPasswordMessage: resetPasswordMessage ?? this.resetPasswordMessage,
      isAuthorized: isAuthorized ?? this.isAuthorized,
      isAuthorizedState: isAuthorizedState ?? this.isAuthorizedState,
      isAuthorizedMessage: isAuthorizedMessage ?? this.isAuthorizedMessage,
      logoutState: logoutState ?? this.logoutState,
      logoutMessage: logoutMessage ?? this.logoutMessage,
    );
  }

  @override
  List<Object> get props {
    return [
      getUser,
      getUserState,
      getUserMessage,
      loginState,
      loginMessage,
      resetPasswordState,
      resetPasswordMessage,
      isAuthorized,
      isAuthorizedState,
      isAuthorizedMessage,
      logoutState,
      logoutMessage,
    ];
  }
}
