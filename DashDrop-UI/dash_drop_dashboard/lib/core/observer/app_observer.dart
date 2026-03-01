import 'package:dash_drop_dashboard/pages/auth/presentation/controller/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/services_locator.dart';

class AppBlocObserver extends BlocObserver {
  AuthBloc authBloc = sl<AuthBloc>();
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    // print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (bloc != authBloc) {
      // print(authBloc.state.isLogin);
      authBloc.add(IsAuthorizedEvent());
    }
    print('onEvent -- ${bloc.runtimeType}, $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // print('onTransition -- ${bloc.runtimeType}, $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('onError -- ${bloc.runtimeType}, $error');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    // print('onClose -- ${bloc.runtimeType}');
  }
}
