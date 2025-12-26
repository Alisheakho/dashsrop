import 'package:dash_drop/pages/authentication/presentation/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:dash_drop/custom_widgets/custom_widgets.dart';
import 'logout_dialog_model.dart';
export 'logout_dialog_model.dart';

class LogoutDialogWidget extends StatefulWidget {
  const LogoutDialogWidget({super.key});

  @override
  State<LogoutDialogWidget> createState() => _LogoutDialogWidgetState();
}

class _LogoutDialogWidgetState extends State<LogoutDialogWidget> {
  LogoutDialogController controller = Get.put(LogoutDialogController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
      child: Container(
        width: () {
          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            return 376;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            return 476;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            return 576;
          } else {
            return 576;
          }
        }()
            .toDouble(),
        height: () {
          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            return 224;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            return 244;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            return 264;
          } else {
            return 264;
          }
        }()
            .toDouble(),
        decoration: BoxDecoration(
          color: CustomTheme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 32.0, 20.0, 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Text(
                  AppLocalizations.of(context).getText(
                    '6bjtny3o' /* Log Out */,
                  ),
                  textAlign: TextAlign.center,
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
                        lineHeight: 1.5,
                      ),
                ),
              ),
              Text(
                AppLocalizations.of(context).getText(
                  'hknbwv0w' /* Are you sure you want to logou... */,
                ),
                textAlign: TextAlign.center,
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
                    const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: ButtonWidget(
                        onPressed: () {
                          Get.back();
                        },
                        text: AppLocalizations.of(context).getText(
                          'gc1t4jsv' /* Cancel */,
                        ),
                        options: ButtonOptions(
                          height: () {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return 46;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return 51;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return 56;
                            } else {
                              return 56;
                            }
                          }()
                              .toDouble(),
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: CustomTheme.of(context).backgroundColor,
                          textStyle: CustomTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'SF Pro Text',
                                color: CustomTheme.of(context).primaryTheme,
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
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: false,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: CustomTheme.of(context).primaryTheme,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ButtonWidget(
                        onPressed: () async {
                          AuthController.to.logout();
                        },
                        text: AppLocalizations.of(context).getText(
                          '5p4mlj2u' /* Log out */,
                        ),
                        options: ButtonOptions(
                          height: () {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return 46;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return 51;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return 56;
                            } else {
                              return 56;
                            }
                          }()
                              .toDouble(),
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: CustomTheme.of(context).primaryTheme,
                          textStyle: CustomTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'SF Pro Text',
                                color: CustomTheme.of(context).white,
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
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: false,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: CustomTheme.of(context).primaryTheme,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(width: 16.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
