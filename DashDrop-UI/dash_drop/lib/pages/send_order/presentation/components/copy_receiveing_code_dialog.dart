import 'package:dash_drop/pages/send_order/presentation/controller/send_order_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '/components/dialog_button_widget.dart';
import 'package:dash_drop/custom_widgets/custom_animations.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CopyReceiveingCodeDialog extends StatefulWidget {
  CopyReceiveingCodeDialog({super.key});

  @override
  State<CopyReceiveingCodeDialog> createState() =>
      _CopyReceiveingCodeDialogState();
}

class _CopyReceiveingCodeDialogState extends State<CopyReceiveingCodeDialog> {
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

  Widget? copeidWidget;

  void copid() {
    copeidWidget = const Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
      child: Icon(
        Icons.done,
        color: Colors.green,
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // CostInfo costInfo = SendOrderController.to.costInfo.value;
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
          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 15.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      0.0, 15.0, 0.0, 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/Success_Top_Up.png',
                      fit: BoxFit.cover,
                    ),
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation']!),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Text(
                  AppLocalizations.of(context).getText(
                    'successfullyRegistered' /* Confirm Your Location */,
                  ),
                  maxLines: 1,
                  style: CustomTheme.of(context).bodyMedium.override(
                        fontFamily: 'SF Pro Text',
                        color: CustomTheme.of(context).primaryTextColor,
                        fontSize: () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return 18;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return 20;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return 22;
                          } else {
                            return 22;
                          }
                        }()
                            .toDouble(),
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        5.0, 20.0, 0.0, 0.0),
                    child: Text(
                      AppLocalizations.of(context).getText(
                        'receivingCode',
                      ),
                      textAlign: TextAlign.right,
                      style: CustomTheme.of(context).bodyMedium.override(
                            fontFamily: 'SF Pro Text',
                            color: CustomTheme.of(context).primaryTextColor,
                            fontSize: 16.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 5.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Clipboard.setData(ClipboardData(
                                text:
                                    SendOrderController.to.receivingCode.value))
                            .then((_) {
                          copid();
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: CustomTheme.of(context).backgroundColor,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: CustomTheme.of(context).black20,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                child: copeidWidget,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Obx(
                                    () => Text(
                                      SendOrderController
                                          .to.receivingCode.value,
                                      style: CustomTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Text',
                                            color:
                                                CustomTheme.of(context).black40,
                                            fontSize: 16.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Clipboard.setData(ClipboardData(
                                            text: SendOrderController
                                                .to.receivingCode.value))
                                        .then((_) {
                                      copid();
                                    });
                                  },
                                  icon: Icon(
                                    Icons.copy,
                                    color: CustomTheme.of(context).primaryTheme,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                child: Text(
                  AppLocalizations.of(context).getText(
                    'registerOrderDisc',
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: CustomTheme.of(context).bodyMedium.override(
                        fontFamily: 'SF Pro Text',
                        color: CustomTheme.of(context).black40,
                        fontSize: () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return 18;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return 20;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return 22;
                          } else {
                            return 24;
                          }
                        }()
                            .toDouble(),
                        useGoogleFonts: false,
                        lineHeight: 1.5,
                      ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Get.back();
                  },
                  child: const DialogButtonWidget(
                    tittle: 'Go To Homepage',
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
