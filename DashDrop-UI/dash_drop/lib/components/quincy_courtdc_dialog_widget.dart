import 'package:get/get.dart';
import 'package:dash_drop/custom_widgets/custom_animations.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:dash_drop/custom_widgets/custom_widgets.dart';
import 'package:dash_drop/routes/app_routes.dart';
import 'quincy_courtdc_dialog_model.dart';
export 'quincy_courtdc_dialog_model.dart';

class QuincyCourtDcDialogWidget extends StatefulWidget {
  const QuincyCourtDcDialogWidget({super.key});

  @override
  State<QuincyCourtDcDialogWidget> createState() =>
      _QuincyCourtDcDialogWidgetState();
}

class _QuincyCourtDcDialogWidgetState extends State<QuincyCourtDcDialogWidget>
    with TickerProviderStateMixin {
  QuincyCourtDcDialogController controller =
      Get.put(QuincyCourtDcDialogController());

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
            return 493;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            return 503;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            return 513;
          } else {
            return 513;
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
                  'assets/images/Quincy_Court_DC.png',
                  width: 172.0,
                  height: 165.0,
                  fit: BoxFit.cover,
                ),
              ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Text(
                  AppLocalizations.of(context).getText(
                    'j2nqcg6o' /* Quincy Court DC */,
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
                  'svshlu5q' /* 45894 Schneemann Road */,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
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
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: SvgPicture.asset(
                          'assets/images/clock_theme.svg',
                          width: () {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return 20;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return 25;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return 30;
                            } else {
                              return 30;
                            }
                          }()
                              .toDouble(),
                          height: () {
                            if (MediaQuery.sizeOf(context).height <
                                kBreakpointSmall) {
                              return 20;
                            } else if (MediaQuery.sizeOf(context).height <
                                kBreakpointMedium) {
                              return 25;
                            } else if (MediaQuery.sizeOf(context).height <
                                kBreakpointLarge) {
                              return 30;
                            } else {
                              return 30;
                            }
                          }()
                              .toDouble(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            6.0, 0.0, 0.0, 0.0),
                        child: Text(
                          AppLocalizations.of(context).getText(
                            '1wjdr2kp' /* 09:00 AM - 05:00PM */,
                          ),
                          maxLines: 1,
                          style: CustomTheme.of(context).bodyMedium.override(
                                fontFamily: 'SF Pro Text',
                                color: CustomTheme.of(context).primaryTextColor,
                                fontSize: () {
                                  if (MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall) {
                                    return 12;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointMedium) {
                                    return 14;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge) {
                                    return 16;
                                  } else {
                                    return 16;
                                  }
                                }()
                                    .toDouble(),
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: SvgPicture.asset(
                          'assets/images/routing_theme.svg',
                          width: 20.0,
                          height: 20.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            6.0, 0.0, 0.0, 0.0),
                        child: Text(
                          AppLocalizations.of(context).getText(
                            'ab5la4m7' /* 3,2 KM from you */,
                          ),
                          maxLines: 1,
                          style: CustomTheme.of(context).bodyMedium.override(
                                fontFamily: 'SF Pro Text',
                                color: CustomTheme.of(context).primaryTextColor,
                                fontSize: () {
                                  if (MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall) {
                                    return 12;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointMedium) {
                                    return 14;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge) {
                                    return 16;
                                  } else {
                                    return 16;
                                  }
                                }()
                                    .toDouble(),
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ButtonWidget(
                      onPressed: () async {
                        Get.toNamed(
                          AppRoutes.orderFormScreenWidget,
                        );
                      },
                      text: AppLocalizations.of(context).getText(
                        'vesw67hu' /* Direction */,
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
                        textStyle: CustomTheme.of(context).titleSmall.override(
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
                  Expanded(
                    child: ButtonWidget(
                      onPressed: () async {
                        Get.toNamed(
                          AppRoutes.orderFormScreenWidget,
                        );
                      },
                      text: AppLocalizations.of(context).getText(
                        'khwab6m3' /* Dial */,
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
                        textStyle: CustomTheme.of(context).titleSmall.override(
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
                ].divide(const SizedBox(width: 16.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
