import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../components/tost.dart';
import 'auth/presentation/controller/auth_bloc.dart';

class CheckAuth extends StatelessWidget {
  const CheckAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isAuthorizedState == RequestState.loaded) {
          if (state.isAuthorized == true) {
           Navigator.pushNamed(context, '/');
          } else{
            Navigator.pushNamed(context, '/login');
          }
        }
      },
      buildWhen: (previous, current) => previous.getUserState != current.getUserState,
      builder: (context, state) {
        return Scaffold(body: Builder(builder: (context) {
          switch (state.isAuthorizedState) {
            case RequestState.loading:
              return Center(
                child: LoadingAnimationWidget.twistingDots(
                  leftDotColor: const Color(0x3c50e0),
                  rightDotColor: const Color(0xc9d9ff),
                  size: 200,
                ),
              );
            case RequestState.loaded:
              return Center(
                child: LoadingAnimationWidget.twistingDots(
                  leftDotColor: const Color(0x3c50e0),
                  rightDotColor: const Color(0xc9d9ff),
                  size: 200,
                ),
              );
            case RequestState.error:
              print(state.isAuthorizedMessage);
              Tost().error(context, "Some error happend");
              Navigator.pushNamed(context, '/login');
              return Container();
          }
        }));
      },
    );
  }
}
