import 'package:get/get.dart';
import 'package:dash_drop/custom_widgets/custom_model.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import '/components/quincy_courtdc_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'nearby_drop_bottomsheet_model.dart';
export 'nearby_drop_bottomsheet_model.dart';

class NearbyDropBottomSheetWidget extends StatefulWidget {
  const NearbyDropBottomSheetWidget({super.key});

  @override
  State<NearbyDropBottomSheetWidget> createState() =>
      _NearbyDropBottomSheetWidgetState();
}

class _NearbyDropBottomSheetWidgetState
    extends State<NearbyDropBottomSheetWidget> {
  NearbyDropBottomSheetController controller =
      Get.put(NearbyDropBottomSheetController());

  @override
  void initState() {
    super.initState();

    controller.textController ??= TextEditingController();
    controller.textFieldFocusNode ??= FocusNode();
  }

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
                const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 18.0),
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
                TextFormField(
                  controller: controller.textController,
                  focusNode: controller.textFieldFocusNode,
                  textInputAction: TextInputAction.go,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelStyle: CustomTheme.of(context).labelMedium.override(
                          fontFamily: 'SF Pro Text',
                          color: CustomTheme.of(context).black40,
                          fontSize: 15.0,
                          useGoogleFonts: false,
                        ),
                    hintText: AppLocalizations.of(context).getText(
                      '11ykzvcu' /* Search location */,
                    ),
                    hintStyle: CustomTheme.of(context).labelMedium.override(
                          fontFamily: 'SF Pro Text',
                          color: CustomTheme.of(context).black40,
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CustomTheme.of(context).primaryTheme,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CustomTheme.of(context).error,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CustomTheme.of(context).error,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    filled: true,
                    fillColor: CustomTheme.of(context).lightGray,
                    contentPadding: const EdgeInsets.all(16.0),
                    prefixIcon: Icon(
                      Icons.search_sharp,
                      color: CustomTheme.of(context).primaryTextColor,
                      size: 24.0,
                    ),
                  ),
                  style: CustomTheme.of(context).bodyMedium.override(
                        fontFamily: 'SF Pro Text',
                        color: CustomTheme.of(context).primaryTextColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: false,
                      ),
                  maxLines: null,
                  cursorColor: CustomTheme.of(context).primaryTheme,
                  validator:
                      controller.textControllerValidator.asValidator(context),
                ),
                Builder(
                  builder: (context) => Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 16.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: const AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: const QuincyCourtDcDialogWidget(),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: SvgPicture.asset(
                                    'assets/images/location_themeColor.svg',
                                    width: 24.0,
                                    height: 24.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            14.0, 0.0, 14.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppLocalizations.of(context).getText(
                                            '6jhji4de' /* Golf Course Alley DC */,
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
                                            'opo0jnp2' /* 4589 Superior Road */,
                                          ),
                                          maxLines: 1,
                                          style: CustomTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'SF Pro Text',
                                                color: CustomTheme.of(context)
                                                    .black40,
                                                fontSize: 14.0,
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
                                    '0qn8uj0f' /* 2.5 KM */,
                                  ),
                                  style: CustomTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Text',
                                        color: CustomTheme.of(context)
                                            .primaryTextColor,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
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
                        ],
                      ),
                    ),
                  ),
                ),
                Builder(
                  builder: (context) => Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 16.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: const AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: const QuincyCourtDcDialogWidget(),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: SvgPicture.asset(
                                    'assets/images/location_themeColor.svg',
                                    width: 24.0,
                                    height: 24.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            14.0, 0.0, 14.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppLocalizations.of(context).getText(
                                            'c15lyckr' /* Pearson Terrace DC */,
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
                                            'g1i7oqrg' /* 856 Messerschmidt Circle */,
                                          ),
                                          maxLines: 1,
                                          style: CustomTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'SF Pro Text',
                                                color: CustomTheme.of(context)
                                                    .black40,
                                                fontSize: 14.0,
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
                                    '4ixbr0rk' /* 5.1 KM */,
                                  ),
                                  style: CustomTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Text',
                                        color: CustomTheme.of(context)
                                            .primaryTextColor,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
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
                        ],
                      ),
                    ),
                  ),
                ),
                Builder(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: const AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: const QuincyCourtDcDialogWidget(),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: SvgPicture.asset(
                                  'assets/images/location_themeColor.svg',
                                  width: 24.0,
                                  height: 24.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      14.0, 0.0, 14.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).getText(
                                          'jqclm0i1' /* Quincy Court DC */,
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
                                          '2fw5lm2f' /* 45894 Schneemann Road */,
                                        ),
                                        maxLines: 1,
                                        style: CustomTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'SF Pro Text',
                                              color: CustomTheme.of(context)
                                                  .black40,
                                              fontSize: 14.0,
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
                                  'gpcsl7id' /* 1.5 KM */,
                                ),
                                style:
                                    CustomTheme.of(context).bodyMedium.override(
                                          fontFamily: 'SF Pro Text',
                                          color: CustomTheme.of(context)
                                              .primaryTextColor,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
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
                      ],
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
