import 'package:dash_drop/pages/send_order/presentation/controller/location_dialog_controller.dart';
import 'package:dash_drop/pages/send_order/presentation/controller/send_order_controller.dart';
import 'package:get/get.dart';
import 'package:dash_drop/pages/send_order/presentation/screens/order_detail_screen_model.dart';

import '../components/sensitivity_levels_select_bottomsheet_widget.dart';
import '../components/vehicle_types_select_bottomsheet_widget.dart';
import '/components/custom_appbar_widget.dart';
import '/components/custom_button_widget.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

export 'order_detail_screen_model.dart';

class OrderDetailScreenWidget extends StatefulWidget {
  const OrderDetailScreenWidget({super.key});

  @override
  State<OrderDetailScreenWidget> createState() =>
      _OrderDetailScreenWidgetState();
}

class _OrderDetailScreenWidgetState extends State<OrderDetailScreenWidget> {
  OrderDetailScreenController controller =
      Get.put(OrderDetailScreenController());

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  // String check = 'assets/images/Radio_button_fill.svg';
  // String uncheck = 'assets/images/Radio_button.svg';
  @override
  void initState() {
    super.initState();

    controller.textController2 ??= TextEditingController();
    controller.textFieldFocusNode2 ??= FocusNode();
    controller.textFieldFocusNode2!.addListener(() => setState(() {}));
    controller.textController3 ??= TextEditingController();
    controller.textFieldFocusNode3 ??= FocusNode();
    controller.textFieldFocusNode3!.addListener(() => setState(() {}));
    controller.textController4 ??= TextEditingController();
    controller.textFieldFocusNode4 ??= FocusNode();
    controller.textFieldFocusNode4!.addListener(() => setState(() {}));
    controller.textController5 ??= TextEditingController();
    controller.textFieldFocusNode5 ??= FocusNode();
    controller.textFieldFocusNode5!.addListener(() => setState(() {}));

  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => controller.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(controller.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomTheme.of(context).backgroundColor,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppbarWidget(
                text: 'Order Detail',
              ),
              Form(
                key: _formKey,
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        20.0, 0.0, 20.0, 0.0),
                    child: ListView(
                      padding: const EdgeInsets.fromLTRB(
                        0,
                        30.0,
                        0,
                        0,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsetsDirectional.fromSTEB(
                        //       0.0, 0.0, 0.0, 10.0),
                        //   child: Row(
                        //     children: [
                        //       InkWell(
                        //         child: ClipRRect(
                        //           borderRadius: BorderRadius.circular(0.0),
                        //           child: SvgPicture.asset(
                        //             paymentOnReceiver ? check : uncheck,
                        //             width: 30.0,
                        //             height: 30.0,
                        //             fit: BoxFit.cover,
                        //           ),
                        //         ),
                        //         onTap: () {
                        //           paymentOnReceiver = true;
                        //           setState(() {});
                        //         },
                        //       ),
                        //       VerticalDivider(),
                        //       Text(
                        //         'Auto Assign',
                        //         style:
                        //             CustomTheme.of(context).bodyMedium.override(
                        //                   fontFamily: 'SF Pro Text',
                        //                   color: CustomTheme.of(context)
                        //                       .primaryTextColor,
                        //                   fontSize: 18.0,
                        //                   fontWeight: FontWeight.w500,
                        //                   useGoogleFonts: false,
                        //                 ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 7,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () => controller
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    controller.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: const SizedBox(
                                            height: 368.0,
                                            child:
                                                SensitivityLevelsSelectBottomsheetWidget(),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context).getText(
                                        'sensitivityLevels',
                                      ),
                                      maxLines: 1,
                                      style: CustomTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Text',
                                            color: CustomTheme.of(context)
                                                .primaryTextColor,
                                            fontSize: 16.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 5.0, 0.0, 0.0),
                                      child: Container(
                                        height: 56.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color:
                                                CustomTheme.of(context).black20,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/Box.svg',
                                                  width: 24.0,
                                                  height: 24.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  SendOrderController
                                                          .to
                                                          .createOrderModel
                                                          .value
                                                          .vehicleDetailSearch
                                                          ?.sensitivityLevel
                                                          .name ??
                                                      'Enter level',
                                                  textAlign: TextAlign.start,
                                                  style: CustomTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SF Pro Text',
                                                        color: CustomTheme.of(
                                                                context)
                                                            .black40,
                                                        fontSize: 16.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 0.0, 15.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/arrow_down.svg',
                                                  width: 24.0,
                                                  height: 24.0,
                                                  fit: BoxFit.cover,
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
                            ),
                            Expanded(
                              flex: 3,
                              child: Align(
                                alignment: const AlignmentDirectional(1.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context).getText(
                                        'q2a7003z' /* Weight */,
                                      ),
                                      maxLines: 1,
                                      style: CustomTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Text',
                                            color: CustomTheme.of(context)
                                                .primaryTextColor,
                                            fontSize: 16.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 5.0, 0.0, 0.0),
                                      child: Container(
                                        height: 56.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color:
                                                CustomTheme.of(context).black20,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  controller: controller
                                                      .textController2,
                                                  focusNode: controller
                                                      .textFieldFocusNode2,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.textController2',
                                                    const Duration(
                                                        milliseconds: 500),
                                                    () => setState(() {}),
                                                  ),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle: CustomTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Text',
                                                          color: CustomTheme.of(
                                                                  context)
                                                              .black40,
                                                          fontSize: 16.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                    hintText:
                                                        AppLocalizations.of(
                                                                context)
                                                            .getText(
                                                      't67qa75b' /* 0 */,
                                                    ),
                                                    hintStyle: CustomTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Text',
                                                          color: CustomTheme.of(
                                                                  context)
                                                              .black40,
                                                          fontSize: 16.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                  ),
                                                  style: CustomTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SF Pro Text',
                                                        color: CustomTheme.of(
                                                                context)
                                                            .primaryTextColor,
                                                        fontSize: 16.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                  cursorColor:
                                                      CustomTheme.of(context)
                                                          .primaryTheme,
                                                  validator: (val) =>
                                                      controller.validate(val),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .getText(
                                                  'hqkuthc6' /* Kg */,
                                                ),
                                                maxLines: 1,
                                                style: CustomTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'SF Pro Text',
                                                      color: CustomTheme.of(
                                                              context)
                                                          .primaryTextColor,
                                                      fontSize: 14.0,
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
                            ),
                          ].divide(const SizedBox(width: 10.0)),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Text(
                            AppLocalizations.of(context).getText(
                              'mimvq4jx' /* Dimension */,
                            ),
                            style: CustomTheme.of(context).bodyMedium.override(
                                  fontFamily: 'SF Pro Text',
                                  color:
                                      CustomTheme.of(context).primaryTextColor,
                                  fontSize: 16.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Container(
                                    height: 56.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: CustomTheme.of(context).black20,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(12.0, 0.0, 12.0, 0.0),
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller:
                                                  controller.textController3,
                                              focusNode: controller
                                                  .textFieldFocusNode3,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController3',
                                                const Duration(
                                                    milliseconds: 500),
                                                () => setState(() {}),
                                              ),
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    CustomTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Text',
                                                          color: CustomTheme.of(
                                                                  context)
                                                              .black40,
                                                          fontSize: 16.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                hintText:
                                                    AppLocalizations.of(context)
                                                        .getText(
                                                  'hhh5smlj' /* Length */,
                                                ),
                                                hintStyle:
                                                    CustomTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Text',
                                                          color: CustomTheme.of(
                                                                  context)
                                                              .black40,
                                                          fontSize: 16.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                              ),
                                              style: CustomTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'SF Pro Text',
                                                    color:
                                                        CustomTheme.of(context)
                                                            .primaryTextColor,
                                                    fontSize: 16.0,
                                                    useGoogleFonts: false,
                                                  ),
                                              cursorColor:
                                                  CustomTheme.of(context)
                                                      .primaryTheme,
                                              validator: (val) =>
                                                  controller.validate(val),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 0.0, 16.0, 0.0),
                                          child: Text(
                                            AppLocalizations.of(context)
                                                .getText(
                                              'xy30o6tg' /* Cm */,
                                            ),
                                            maxLines: 1,
                                            style: CustomTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'SF Pro Text',
                                                  color: CustomTheme.of(context)
                                                      .primaryTextColor,
                                                  fontSize: 13.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Container(
                                    height: 56.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: CustomTheme.of(context).black20,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(12.0, 0.0, 12.0, 0.0),
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller:
                                                  controller.textController4,
                                              focusNode: controller
                                                  .textFieldFocusNode4,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController4',
                                                const Duration(
                                                    milliseconds: 500),
                                                () => setState(() {}),
                                              ),
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    CustomTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Text',
                                                          color: CustomTheme.of(
                                                                  context)
                                                              .black40,
                                                          fontSize: 16.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                hintText:
                                                    AppLocalizations.of(context)
                                                        .getText(
                                                  'hr2j68i7' /* Width */,
                                                ),
                                                hintStyle:
                                                    CustomTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Text',
                                                          color: CustomTheme.of(
                                                                  context)
                                                              .black40,
                                                          fontSize: 16.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                              ),
                                              style: CustomTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'SF Pro Text',
                                                    color:
                                                        CustomTheme.of(context)
                                                            .primaryTextColor,
                                                    fontSize: 16.0,
                                                    useGoogleFonts: false,
                                                  ),
                                              cursorColor:
                                                  CustomTheme.of(context)
                                                      .primaryTheme,
                                              validator: (val) =>
                                                  controller.validate(val),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 0.0, 16.0, 0.0),
                                          child: Text(
                                            AppLocalizations.of(context)
                                                .getText(
                                              'hgywwpoh' /* Cm */,
                                            ),
                                            maxLines: 1,
                                            style: CustomTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'SF Pro Text',
                                                  color: CustomTheme.of(context)
                                                      .primaryTextColor,
                                                  fontSize: 13.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Container(
                                    height: 56.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: CustomTheme.of(context).black20,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(12.0, 0.0, 12.0, 0.0),
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller:
                                                  controller.textController5,
                                              focusNode: controller
                                                  .textFieldFocusNode5,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController5',
                                                const Duration(
                                                    milliseconds: 500),
                                                () => setState(() {}),
                                              ),
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    CustomTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Text',
                                                          color: CustomTheme.of(
                                                                  context)
                                                              .black40,
                                                          fontSize: 16.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                hintText:
                                                    AppLocalizations.of(context)
                                                        .getText(
                                                  'p89yb2rk' /* Height */,
                                                ),
                                                hintStyle:
                                                    CustomTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Text',
                                                          color: CustomTheme.of(
                                                                  context)
                                                              .black40,
                                                          fontSize: 16.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                              ),
                                              style: CustomTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'SF Pro Text',
                                                    color:
                                                        CustomTheme.of(context)
                                                            .primaryTextColor,
                                                    fontSize: 16.0,
                                                    useGoogleFonts: false,
                                                  ),
                                              cursorColor:
                                                  CustomTheme.of(context)
                                                      .primaryTheme,
                                              validator: (val) =>
                                                  controller.validate(val),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 0.0, 16.0, 0.0),
                                          child: Text(
                                            AppLocalizations.of(context)
                                                .getText(
                                              'ky4kfsxu' /* Cm */,
                                            ),
                                            maxLines: 1,
                                            style: CustomTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'SF Pro Text',
                                                  color: CustomTheme.of(context)
                                                      .primaryTextColor,
                                                  fontSize: 13.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 10.0)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Text(
                            AppLocalizations.of(context).getText(
                              'vehicleTypes',
                            ),
                            style: CustomTheme.of(context).bodyMedium.override(
                                  fontFamily: 'SF Pro Text',
                                  color:
                                      CustomTheme.of(context).primaryTextColor,
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
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => controller
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context).requestFocus(
                                            controller.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: const SizedBox(
                                        height: 550.0,
                                        child:
                                            VehicleTypesSelectBottomsheetWidget(),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
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
                                    16.0, 15.0, 20.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: SvgPicture.asset(
                                        'assets/images/vehicleTypes.svg',
                                        width: 24.0,
                                        height: 24.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          SendOrderController
                                                      .to
                                                      .createOrderModel
                                                      .value
                                                      .vehicleDetailSearch
                                                      ?.vehicleType
                                                      .name ==
                                                  null
                                              ? AppLocalizations.of(context)
                                                  .getText(
                                                  'selectVehicleTypes',
                                                )
                                              : SendOrderController
                                                  .to
                                                  .createOrderModel
                                                  .value
                                                  .vehicleDetailSearch!
                                                  .vehicleType
                                                  .name,
                                          style: CustomTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'SF Pro Text',
                                                color: CustomTheme.of(context)
                                                    .black40,
                                                fontSize: 16.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: SvgPicture.asset(
                                        'assets/images/arrow_down.svg',
                                        width: 24.0,
                                        height: 24.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 10.0),
                          child: Divider(),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {},
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
                                    10.0, 5.0, 15.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Delivery Cost Payment on Reciver',
                                          style: CustomTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'SF Pro Text',
                                                color: CustomTheme.of(context)
                                                    .black40,
                                                fontSize: 14.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Switch(
                                      value: SendOrderController
                                          .to
                                          .createOrderModel
                                          .value
                                          .paymentResponsibility,
                                      onChanged: (value) {
                                        SendOrderController
                                            .to
                                            .createOrderModel
                                            .value
                                            .paymentResponsibility = value;
                                        setState(() {});
                                      },
                                      activeColor:
                                          CustomTheme.of(context).primaryTheme,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    20.0, 24.0, 20.0, 40.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    print(SendOrderController
                        .to.createOrderModel.value.paymentResponsibility);
                    if (_formKey.currentState!.validate()) {
                      SendOrderController.to.createOrderModel.value
                              .vehicleDetailSearch?.weightKg =
                          double.parse(controller.textController2.text);
                      SendOrderController.to.createOrderModel.value
                              .vehicleDetailSearch?.lenghtM =
                          double.parse(controller.textController3.text) / 100;
                      SendOrderController.to.createOrderModel.value
                              .vehicleDetailSearch?.widthM =
                          double.parse(controller.textController4.text) / 100;
                      SendOrderController.to.createOrderModel.value
                              .vehicleDetailSearch?.heightM =
                          double.parse(controller.textController2.text) / 100;
                      SendOrderController.to.createOrder();
                    }
                  },
                  child: const CustomButtonWidget(
                    tittle: 'Create',
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
