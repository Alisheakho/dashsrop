import 'package:dash_drop_dashboard/pages/auth/presentation/controller/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';
import 'package:dashdrop_uikit/components/buttons/button_widget.dart';
import 'package:dashdrop_uikit/components/card/common_card.dart';
import 'package:dashdrop_uikit/components/forms/outborder_text_form_field.dart';
import 'package:dash_drop_dashboard/core/theme/global_colors.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../components/tost.dart';
import '../../../../core/utils/enums.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.loginState == RequestState.loaded) {
          Tost().success(context, "Login success");
          Navigator.popAndPushNamed(context, '/');
        } else if (state.loginState == RequestState.error) {
          Tost().error(context, state.loginMessage);
        }
      },
      // buildWhen: (previous, current) =>
      //     previous.loginState != current.loginState,
      builder: (context, state) {
        return Scaffold(body: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.deviceScreenType ==
                DeviceScreenType.desktop) {
              return Center(
                child: contentDesktopWidget(context),
              );
            }

            return contentMobileWidget(context);
          },
        ));
      },
    );
  }

  Widget contentDesktopWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CommonCard(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.95,
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
                child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.appName,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: 350,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: SvgPicture.asset('assets/signin/main.svg',
                      semanticsLabel: ''),
                )
              ],
            )),
            const VerticalDivider(
              width: 1,
              color: GlobalColors.background,
            ),
            Expanded(
              child: _signInFormWidget(context),
            )
          ]),
        )
      ],
    );
  }

  Widget contentMobileWidget(BuildContext context) {
    return CommonCard(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: _signInFormWidget(context));
  }

  Widget _signInFormWidget(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.signIn,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              OutBorderTextFormField(
                labelText: AppLocalizations.of(context)!.email,
                hintText: AppLocalizations.of(context)!.emailHint,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty ||
                      !value.contains('@') ||
                      !value.contains('.')) {
                    Tost()
                        .warning(context, 'Please enter a valid email address');
                    isValid = false;
                  }
                  return null;
                },
                suffixWidget: SvgPicture.asset(
                  'assets/signin/email.svg',
                  width: 22,
                  height: 22,
                ),
                controller: emailController,
              ),
              const SizedBox(
                height: 16,
              ),
              OutBorderTextFormField(
                obscureText: true,
                labelText: AppLocalizations.of(context)!.password,
                hintText: AppLocalizations.of(context)!.passwordHint,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value!.isEmpty || value.length < 8) {
                    Tost().warning(context, 'Please enter a valid password');
                    isValid = false;
                  }
                  return null;
                },
                suffixWidget: SvgPicture.asset(
                  'assets/signin/lock.svg',
                  width: 22,
                  height: 22,
                ),
                controller: passwordController,
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                type: ButtonType.primary.type,
                btnText: AppLocalizations.of(context)!.signIn,
                onTap: () {
                  isValid = true;
                  _formKey.currentState?.validate();
                  if (true == isValid) {
                    try {
                      context.read<AuthBloc>().add(LoginEvent(
                          email: emailController.text,
                          password: passwordController.text));
                    } catch (e) {
                      print(e);
                      Tost().error(context, e.toString());
                    }
                  }
                  // var islog = context.read<AuthBloc>().state.isLogin;
                  // print(islog);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Expanded(
                      child: Divider(
                    height: 1,
                    color: GlobalColors.border,
                  )),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(AppLocalizations.of(context)!.dashDrop),
                  ),
                  const Expanded(
                      child: Divider(
                    height: 1,
                    color: GlobalColors.border,
                  )),
                ],
              ),
            ],
          ),
        ));
  }
}
