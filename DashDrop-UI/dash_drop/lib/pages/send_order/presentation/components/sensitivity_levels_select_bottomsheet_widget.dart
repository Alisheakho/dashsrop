import 'package:dash_drop/core/utils/enums.dart';
import 'package:dash_drop/pages/send_order/presentation/controller/send_order_controller.dart';
import 'package:get/get.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SensitivityLevelsSelectBottomsheetWidget extends StatefulWidget {
  const SensitivityLevelsSelectBottomsheetWidget({super.key});

  @override
  State<SensitivityLevelsSelectBottomsheetWidget> createState() =>
      _SensitivityLevelsSelectBottomsheetWidgetState();
}

class _SensitivityLevelsSelectBottomsheetWidgetState
    extends State<SensitivityLevelsSelectBottomsheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: CustomTheme.of(context).backgroundColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Stack(
        alignment: const AlignmentDirectional(1.0, -1.0),
        children: [
          Padding(
            padding:
                const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 60.0,
                    height: 6.0,
                    decoration: BoxDecoration(
                      color: CustomTheme.of(context).black20,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 40.0, 0.0, 0.0),
                    child: Text(
                      AppLocalizations.of(context).getText(
                        'sensitivityLevels',
                      ),
                      maxLines: 1,
                      style: CustomTheme.of(context).bodyMedium.override(
                            fontFamily: 'SF Pro Text',
                            color: CustomTheme.of(context).primaryTextColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    SendOrderController
                        .to
                        .createOrderModel
                        .value
                        .vehicleDetailSearch
                        ?.sensitivityLevel = SensitivityLevels.low;
                    Get.back();
                  },
                  child: Container(
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
                            height: 40.0,
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
                              child: Text(
                                'Low',
                                textAlign: TextAlign.center,
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    SendOrderController
                        .to
                        .createOrderModel
                        .value
                        .vehicleDetailSearch
                        ?.sensitivityLevel = SensitivityLevels.medim;
                    Get.back();
                  },
                  child: Container(
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
                            height: 40.0,
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
                              child: Text(
                                'Medim',
                                textAlign: TextAlign.center,
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    SendOrderController
                        .to
                        .createOrderModel
                        .value
                        .vehicleDetailSearch
                        ?.sensitivityLevel = SensitivityLevels.high;
                    Get.back();
                  },
                  child: Container(
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
                            height: 40.0,
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
                              child: Text(
                                'High',
                                textAlign: TextAlign.center,
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    SendOrderController
                        .to
                        .createOrderModel
                        .value
                        .vehicleDetailSearch
                        ?.sensitivityLevel = SensitivityLevels.critical;
                    Get.back();
                  },
                  child: Container(
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
                            height: 40.0,
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
                              child: Text(
                                'Critical',
                                textAlign: TextAlign.center,
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 12.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Get.back();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: SvgPicture.asset(
                  'assets/images/close.svg',
                  width: 24.0,
                  height: 24.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
