// ignore_for_file: unnecessary_null_comparison

import 'package:get/get.dart';
import 'package:dash_drop/pages/bottom_page/bottom_page_controller.dart';

import 'package:dash_drop/routes/app_routes.dart';

import '/components/dialog_button_widget.dart';
import 'package:dash_drop/custom_widgets/custom_animations.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'scan_barcode_success_dialog_model.dart';
export 'scan_barcode_success_dialog_model.dart';

class ScanBarcodeSuccessDialogWidget extends StatefulWidget {
  const ScanBarcodeSuccessDialogWidget({super.key});

  @override
  State<ScanBarcodeSuccessDialogWidget> createState() =>
      _ScanBarcodeSuccessDialogWidgetState();
}

class _ScanBarcodeSuccessDialogWidgetState
    extends State<ScanBarcodeSuccessDialogWidget>
    with TickerProviderStateMixin {
  ScanBarcodeSuccessDialogController controller =
      Get.put(ScanBarcodeSuccessDialogController());
  HomepageLongContainerController homepageLongContainerController =
      Get.put(HomepageLongContainerController());

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
            return 567;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            return 587;
          } else if (MediaQuery.sizeOf(context).width != null) {
            return 607;
          } else {
            return 607;
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
                  'assets/images/Success_Your_Order.png',
                  width: 172.0,
                  height: 165.0,
                  fit: BoxFit.cover,
                ),
              ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Text(
                  AppLocalizations.of(context).getText(
                    'u411a93c' /* Scan Barcode Success */,
                  ),
                  textAlign: TextAlign.center,
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
                  '68znnykb' /* Your code has been
successfull... */
                  ,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                style: CustomTheme.of(context).bodyMedium.override(
                      fontFamily: 'SF Pro Text',
                      color: CustomTheme.of(context).black40,
                      fontSize: () {
                        if (MediaQuery.sizeOf(context).height <
                            kBreakpointSmall) {
                          return 16;
                        } else if (MediaQuery.sizeOf(context).height <
                            kBreakpointMedium) {
                          return 20;
                        } else if (MediaQuery.sizeOf(context).height <
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
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: CustomTheme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: CustomTheme.of(context).black10,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      10.0, 10.0, 20.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: CustomTheme.of(context).secondaryTheme,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: SvgPicture.asset(
                            'assets/images/Order.svg',
                            width: 24.0,
                            height: 24.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context).getText(
                                  '3jtdzlkr' /* HV458792547 */,
                                ),
                                maxLines: 1,
                                style:
                                    CustomTheme.of(context).bodyMedium.override(
                                          fontFamily: 'SF Pro Text',
                                          color: CustomTheme.of(context)
                                              .primaryTextColor,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                          lineHeight: 1.5,
                                        ),
                              ),
                              Text(
                                AppLocalizations.of(context).getText(
                                  'ro1xlxji' /* Processed at sort facility */,
                                ),
                                maxLines: 1,
                                style: CustomTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'SF Pro Text',
                                      color: CustomTheme.of(context).black40,
                                      useGoogleFonts: false,
                                      lineHeight: 1.5,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context).getText(
                          '4yh0rmwv' /* 1 Hour */,
                        ),
                        style: CustomTheme.of(context).bodyMedium.override(
                              fontFamily: 'SF Pro Text',
                              color: CustomTheme.of(context).black40,
                              fontSize: 12.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ],
                  ),
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
                    // setState(() {
                    //   controller1.selectIndex = 0;
                    // });
                    // await controller1.pageViewController?.animateToPage(
                    //   controller1.selectIndex!,
                    //   duration: const Duration(milliseconds: 500),
                    //   curve: Curves.ease,
                    // );
                    homepageLongContainerController.selectIndex.value = 0;

                    homepageLongContainerController.update();
                    Get.toNamed(
                      AppRoutes.homepageContainerScreen,
                    );
                  },
                  child: const DialogButtonWidget(
                    tittle: 'View Detail',
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
