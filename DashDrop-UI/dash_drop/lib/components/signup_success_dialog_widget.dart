import 'package:get/get.dart';
import 'package:dash_drop/components/signup_success_dialog_widget.dart';
import 'package:dash_drop/routes/app_routes.dart';

import '/components/dialog_button_widget.dart';
import 'package:dash_drop/custom_widgets/custom_animations.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';

export 'signup_success_dialog_model.dart';

class SignupSuccessDialogWidget extends StatefulWidget {
  const SignupSuccessDialogWidget({super.key});

  @override
  State<SignupSuccessDialogWidget> createState() =>
      _SignupSuccessDialogWidgetState();
}

class _SignupSuccessDialogWidgetState extends State<SignupSuccessDialogWidget>
    with TickerProviderStateMixin {
  SignupSuccessDialogController controller =
      Get.put(SignupSuccessDialogController());

  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 500.ms,
          begin: 0.5,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
      child: Container(
        width: () {
          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            return 414;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            return 424;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            return 434;
          } else {
            return 434;
          }
        }()
            .toDouble(),
        height: () {
          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            return 477;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            return 497;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            return 517;
          } else {
            return 517;
          }
        }()
            .toDouble(),
        decoration: BoxDecoration(
          color: CustomTheme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 48.0, 20.0, 48.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/signup_success.png',
                  width: 172.0,
                  height: 165.0,
                  fit: BoxFit.cover,
                ),
              ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Text(
                  AppLocalizations.of(context).getText(
                    'cx1ocjjh' /* Congratulations! */,
                  ),
                  maxLines: 1,
                  style: CustomTheme.of(context).bodyMedium.override(
                        fontFamily: 'SF Pro Text',
                        color: CustomTheme.of(context).primaryTextColor,
                        fontSize: () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return 28;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return 30;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return 32;
                          } else {
                            return 32;
                          }
                        }()
                            .toDouble(),
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              Text(
                AppLocalizations.of(context).getText(
                  'bsltc3ar' /* Your account is ready to use.Y... */,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                style: CustomTheme.of(context).bodyMedium.override(
                      fontFamily: 'SF Pro Text',
                      color: CustomTheme.of(context).black40,
                      fontSize: () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return 16;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return 20;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return 24;
                        } else {
                          return 24;
                        }
                      }()
                          .toDouble(),
                      useGoogleFonts: false,
                      lineHeight: 1.5,
                    ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(60.0, 0.0, 60.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Get.toNamed(
                      AppRoutes.homepageContainerScreen,
                    );
                  },
                  child: const DialogButtonWidget(
                    tittle: 'Go to Homepage',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
