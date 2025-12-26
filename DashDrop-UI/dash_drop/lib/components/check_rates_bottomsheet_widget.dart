import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'check_rates_bottomsheet_model.dart';
export 'check_rates_bottomsheet_model.dart';

class CheckRatesBottomSheetWidget extends StatefulWidget {
  const CheckRatesBottomSheetWidget({super.key});

  @override
  State<CheckRatesBottomSheetWidget> createState() =>
      _CheckRatesBottomSheetWidgetState();
}

class _CheckRatesBottomSheetWidgetState
    extends State<CheckRatesBottomSheetWidget> {
  CheckRatesBottomSheetController controller =
      Get.put(CheckRatesBottomSheetController());

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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      0.0, 40.0, 0.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context).getText(
                                '4ciq4sdr' /* 1304 Tiffin Ave,
Findlay */
                                ,
                              ),
                              maxLines: 2,
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Text(
                                AppLocalizations.of(context).getText(
                                  '0zxy1rlk' /* Picked Up */,
                                ),
                                style:
                                    CustomTheme.of(context).bodyMedium.override(
                                          fontFamily: 'SF Pro Text',
                                          color: CustomTheme.of(context)
                                              .lightModeGrey01,
                                          fontSize: 12.0,
                                          useGoogleFonts: false,
                                        ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: SvgPicture.asset(
                          'assets/images/arrow_swap.svg',
                          width: 24.0,
                          height: 24.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: const AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context).getText(
                                  'd2yb2ui8' /* 1410  Market St,
Celina */
                                  ,
                                ),
                                maxLines: 2,
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
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  AppLocalizations.of(context).getText(
                                    'gdqcblmt' /* Destionation */,
                                  ),
                                  style: CustomTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Text',
                                        color: CustomTheme.of(context)
                                            .lightModeGrey01,
                                        fontSize: 12.0,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 0.0,
                  thickness: 1.0,
                  color: CustomTheme.of(context).containerBorder,
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(
                      0,
                      16.0,
                      0,
                      0,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 16.0),
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
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color:
                                        CustomTheme.of(context).secondaryTheme,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  alignment:
                                      const AlignmentDirectional(0.0, 0.0),
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
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppLocalizations.of(context).getText(
                                            '1m3c5qg7' /* Cargo Service */,
                                          ),
                                          maxLines: 1,
                                          style: CustomTheme.of(context)
                                              .bodyMedium
                                              .override(
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
                                            's3od9ias' /* Safe delivery */,
                                          ),
                                          maxLines: 1,
                                          style: CustomTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'SF Pro Text',
                                                color: CustomTheme.of(context)
                                                    .black40,
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
                                    '0rzihla3' /* $20 */,
                                  ),
                                  style: CustomTheme.of(context)
                                      .bodyMedium
                                      .override(
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
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 16.0),
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
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color:
                                        CustomTheme.of(context).secondaryTheme,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  alignment:
                                      const AlignmentDirectional(0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: SvgPicture.asset(
                                      'assets/images/Regular_Service_truck.svg',
                                      width: 24.0,
                                      height: 24.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppLocalizations.of(context).getText(
                                            'fmsk4z6w' /* Regular Service */,
                                          ),
                                          maxLines: 1,
                                          style: CustomTheme.of(context)
                                              .bodyMedium
                                              .override(
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
                                            'yf20x3ck' /* Affordable prices */,
                                          ),
                                          maxLines: 1,
                                          style: CustomTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'SF Pro Text',
                                                color: CustomTheme.of(context)
                                                    .black40,
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
                                    'hjy3fl32' /* $30 */,
                                  ),
                                  style: CustomTheme.of(context)
                                      .bodyMedium
                                      .override(
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
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 16.0),
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
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color:
                                        CustomTheme.of(context).secondaryTheme,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  alignment:
                                      const AlignmentDirectional(0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: SvgPicture.asset(
                                      'assets/images/Express_Service_truck.svg',
                                      width: 24.0,
                                      height: 24.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppLocalizations.of(context).getText(
                                            'tb2xbz19' /* Express Service */,
                                          ),
                                          maxLines: 1,
                                          style: CustomTheme.of(context)
                                              .bodyMedium
                                              .override(
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
                                            'zjgxkdxu' /* 2 day - 5 day */,
                                          ),
                                          maxLines: 1,
                                          style: CustomTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'SF Pro Text',
                                                color: CustomTheme.of(context)
                                                    .black40,
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
                                    '97gtagn0' /* $50 */,
                                  ),
                                  style: CustomTheme.of(context)
                                      .bodyMedium
                                      .override(
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
                      ),
                    ],
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
