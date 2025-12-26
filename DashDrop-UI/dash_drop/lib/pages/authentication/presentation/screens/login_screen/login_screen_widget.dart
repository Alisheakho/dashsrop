import 'dart:developer';

import 'package:dash_drop/core/utils/enums.dart';
import 'package:dash_drop/pages/authentication/presentation/controller/auth_controller.dart';
import 'package:dash_drop/pages/authentication/presentation/screens/login_screen/login_screen_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:dash_drop/custom_widgets/custom_button_tabbar.dart';
import 'package:dash_drop/custom_widgets/phone_field/intl_phone_field.dart';
import '../../components/data_picker.dart';
import '/components/custom_button_widget.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

export 'login_screen_model.dart';

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({super.key});

  @override
  State<LoginScreenWidget> createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreenWidget>
    with TickerProviderStateMixin {
  LoginScreenController controller = Get.put(LoginScreenController());
  AuthController authController = Get.find<AuthController>();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();

  String check = 'assets/images/Radio_button_fill.svg';
  String uncheck = 'assets/images/Radio_button.svg';
  bool isMale = true;

  @override
  void initState() {
    super.initState();

    controller.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    controller.textController1 ??= TextEditingController();
    controller.textFieldFocusNode1 ??= FocusNode();

    controller.textController11 ??= TextEditingController();
    controller.textFieldFocusNode11 ??= FocusNode();

    controller.textController2 ??= TextEditingController();
    controller.textFieldFocusNode2 ??= FocusNode();

    controller.textController3 ??= TextEditingController();
    controller.textFieldFocusNode3 ??= FocusNode();

    controller.textController4 ??= TextEditingController();
    controller.textFieldFocusNode4 ??= FocusNode();

    controller.textController5 ??= TextEditingController();
    controller.textFieldFocusNode5 ??= FocusNode();

    controller.textController6 ??= TextEditingController();
    controller.textFieldFocusNode6 ??= FocusNode();
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
        backgroundColor: CustomTheme.of(context).backgroundColor,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 46.0,
                decoration: BoxDecoration(
                  color: CustomTheme.of(context).backgroundColor,
                ),
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Text(
                  controller.tabBarCurrentIndex == 0
                      ? 'Create your Account'
                      : 'Login to your Account',
                  style: CustomTheme.of(context).bodyMedium.override(
                        fontFamily: 'SF Pro Text',
                        color: CustomTheme.of(context).primaryTextColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 34.0, 0.0, 0.0),
                  child: Stack(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 54.0,
                            decoration: BoxDecoration(
                              color: CustomTheme.of(context).lightGray,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: const Alignment(0.0, 0),
                              child: CustomButtonTabBar(
                                useToggleButtonStyle: false,
                                labelStyle: CustomTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'SF Pro Text',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                                unselectedLabelStyle: const TextStyle(),
                                labelColor:
                                    CustomTheme.of(context).primaryTextColor,
                                unselectedLabelColor:
                                    CustomTheme.of(context).black40,
                                backgroundColor: CustomTheme.of(context).white,
                                borderWidth: 0.0,
                                borderRadius: 50.0,
                                elevation: 0.0,
                                buttonMargin: const EdgeInsets.all(4.0),
                                tabs: [
                                  Tab(
                                    text: AppLocalizations.of(context).getText(
                                      'z8slfq2k' /* Sign Up */,
                                    ),
                                  ),
                                  Tab(
                                    text: AppLocalizations.of(context).getText(
                                      'uq0f74jc' /* Sign In */,
                                    ),
                                  ),
                                ],
                                controller: controller.tabBarController,
                                onTap: (i) async {
                                  [() async {}, () async {}][i]();
                                },
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: controller.tabBarController,
                                children: [
                                  ListView(
                                    padding: const EdgeInsets.fromLTRB(
                                      0,
                                      32.0,
                                      0,
                                      32.0,
                                    ),
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Form(
                                        key: formKey2,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 5.0, 0.0, 0.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'firstName',
                                                          ),
                                                          style: CustomTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Text',
                                                                color: CustomTheme.of(
                                                                        context)
                                                                    .primaryTextColor,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                        TextFormField(
                                                          controller: controller
                                                              .textController1,
                                                          focusNode: controller
                                                              .textFieldFocusNode1,
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelStyle:
                                                                CustomTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'SF Pro Text',
                                                                      color: CustomTheme.of(
                                                                              context)
                                                                          .black40,
                                                                      fontSize:
                                                                          16.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                            hintText:
                                                                AppLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'firstNameHint',
                                                            ),
                                                            hintStyle:
                                                                CustomTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'SF Pro Text',
                                                                      color: CustomTheme.of(
                                                                              context)
                                                                          .black40,
                                                                      fontSize:
                                                                          16.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                            errorStyle:
                                                                CustomTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'SF Pro Text',
                                                                      color: CustomTheme.of(
                                                                              context)
                                                                          .errorText,
                                                                      fontSize:
                                                                          16.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: CustomTheme.of(
                                                                        context)
                                                                    .black20,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: CustomTheme.of(
                                                                        context)
                                                                    .primaryTheme,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: CustomTheme.of(
                                                                        context)
                                                                    .errorText,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: CustomTheme.of(
                                                                        context)
                                                                    .errorText,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: CustomTheme
                                                                    .of(context)
                                                                .backgroundColor,
                                                          ),
                                                          style: CustomTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Text',
                                                                color: CustomTheme.of(
                                                                        context)
                                                                    .primaryTextColor,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                          cursorColor:
                                                              CustomTheme.of(
                                                                      context)
                                                                  .primaryTheme,
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return AppLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                '3kka47zo' /* Please enter a valid full name */,
                                                              );
                                                            }
                                                            return null;
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const VerticalDivider(),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'lastName',
                                                          ),
                                                          style: CustomTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Text',
                                                                color: CustomTheme.of(
                                                                        context)
                                                                    .primaryTextColor,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                        TextFormField(
                                                          controller: controller
                                                              .textController11,
                                                          focusNode: controller
                                                              .textFieldFocusNode11,
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelStyle:
                                                                CustomTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'SF Pro Text',
                                                                      color: CustomTheme.of(
                                                                              context)
                                                                          .black40,
                                                                      fontSize:
                                                                          16.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                            hintText:
                                                                AppLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'lastNameHint',
                                                            ),
                                                            hintStyle:
                                                                CustomTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'SF Pro Text',
                                                                      color: CustomTheme.of(
                                                                              context)
                                                                          .black40,
                                                                      fontSize:
                                                                          16.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                            errorStyle:
                                                                CustomTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'SF Pro Text',
                                                                      color: CustomTheme.of(
                                                                              context)
                                                                          .errorText,
                                                                      fontSize:
                                                                          16.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: CustomTheme.of(
                                                                        context)
                                                                    .black20,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: CustomTheme.of(
                                                                        context)
                                                                    .primaryTheme,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: CustomTheme.of(
                                                                        context)
                                                                    .errorText,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: CustomTheme.of(
                                                                        context)
                                                                    .errorText,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: CustomTheme
                                                                    .of(context)
                                                                .backgroundColor,
                                                          ),
                                                          style: CustomTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Text',
                                                                color: CustomTheme.of(
                                                                        context)
                                                                    .primaryTextColor,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                          cursorColor:
                                                              CustomTheme.of(
                                                                      context)
                                                                  .primaryTheme,
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return AppLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                '3kka47zo' /* Please enter a valid full name */,
                                                              );
                                                            }
                                                            return null;
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .getText(
                                                  'email' /* Phone Number */,
                                                ),
                                                style: CustomTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'SF Pro Text',
                                                      color: CustomTheme.of(
                                                              context)
                                                          .primaryTextColor,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 5.0, 0.0, 0.0),
                                              child: TextFormField(
                                                controller:
                                                    controller.textController6,
                                                focusNode: controller
                                                    .textFieldFocusNode4,
                                                textInputAction:
                                                    TextInputAction.next,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
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
                                                  hintText: AppLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'emailHint' /* example@example.com */,
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
                                                  errorStyle: CustomTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SF Pro Text',
                                                        color: CustomTheme.of(
                                                                context)
                                                            .errorText,
                                                        fontSize: 16.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: CustomTheme.of(
                                                              context)
                                                          .black20,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: CustomTheme.of(
                                                              context)
                                                          .primaryTheme,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: CustomTheme.of(
                                                              context)
                                                          .errorText,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: CustomTheme.of(
                                                              context)
                                                          .errorText,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      CustomTheme.of(context)
                                                          .backgroundColor,
                                                ),
                                                style: CustomTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'SF Pro Text',
                                                      color: CustomTheme.of(
                                                              context)
                                                          .primaryTextColor,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts: false,
                                                    ),
                                                cursorColor:
                                                    CustomTheme.of(context)
                                                        .primaryTheme,
                                                validator: (val) {
                                                  if (val == null ||
                                                      val.isEmpty ||
                                                      !GetUtils.isEmail(val)) {
                                                    return AppLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'validEmail' /* Please enter a valid email... */,
                                                    );
                                                  }

                                                  return null;
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .getText(
                                                  'a9acmnfp' /* Phone Number */,
                                                ),
                                                style: CustomTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'SF Pro Text',
                                                      color: CustomTheme.of(
                                                              context)
                                                          .primaryTextColor,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 5.0, 0.0, 0.0),
                                              child: IntlPhoneField(
                                                controller:
                                                    controller.textController2,
                                                focusNode: controller
                                                    .textFieldFocusNode2,
                                                initialCountryCode: 'TR',
                                                disableLengthCheck: true,
                                                showCountryFlag: false,
                                                flagsButtonPadding:
                                                    EdgeInsets.zero,
                                                flagsButtonMargin:
                                                    const EdgeInsets.only(
                                                        left: 16, right: 0),
                                                style: CustomTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'SF Pro Text',
                                                      color: CustomTheme.of(
                                                              context)
                                                          .primaryTextColor,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts: false,
                                                    ),
                                                dropdownTextStyle:
                                                    CustomTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Text',
                                                          color: CustomTheme.of(
                                                                  context)
                                                              .primaryTextColor,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: false,
                                                        ),
                                                cursorColor:
                                                    CustomTheme.of(context)
                                                        .primaryTheme,
                                                dropdownIconPosition:
                                                    IconPosition.trailing,
                                                dropdownIcon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: Colors.black),
                                                dropdownDecoration:
                                                    const BoxDecoration(),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return AppLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '1z2k6u9v' /* Please enter a valid phone num... */,
                                                    );
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  floatingLabelStyle:
                                                      CustomTheme.of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'SF Pro Text',
                                                            color: CustomTheme
                                                                    .of(context)
                                                                .primaryTextColor,
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  hintText: AppLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'pxn1e11f' /*  Enter phone number */,
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                12)),
                                                    borderSide: BorderSide(
                                                      color: CustomTheme.of(
                                                              context)
                                                          .errorText,
                                                      width: 1,
                                                    ),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: CustomTheme.of(
                                                              context)
                                                          .black20,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  border:
                                                      const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                    ),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                12)),
                                                    borderSide: BorderSide(
                                                      color: CustomTheme.of(
                                                              context)
                                                          .errorText,
                                                      width: 1,
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    borderSide: BorderSide(
                                                      color: CustomTheme.of(
                                                              context)
                                                          .primaryTextColor,
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                                onChanged: (phone) {
                                                  log(phone.completeNumber);
                                                },
                                                keyboardType:
                                                    TextInputType.number,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .getText(
                                                  'pcerqf9r' /* Password */,
                                                ),
                                                style: CustomTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'SF Pro Text',
                                                      color: CustomTheme.of(
                                                              context)
                                                          .primaryTextColor,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 5.0, 0.0, 0.0),
                                              child: Obx(
                                                () => TextFormField(
                                                  controller: controller
                                                      .textController3,
                                                  focusNode: controller
                                                      .textFieldFocusNode3,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  obscureText: controller
                                                      .isShowPassword.value,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        AppLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'zu2i71c6' /* Enter your password */,
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
                                                    errorStyle: CustomTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Text',
                                                          color: CustomTheme.of(
                                                                  context)
                                                              .errorText,
                                                          fontSize: 16.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: CustomTheme.of(
                                                                context)
                                                            .black20,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: CustomTheme.of(
                                                                context)
                                                            .primaryTheme,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: CustomTheme.of(
                                                                context)
                                                            .errorText,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: CustomTheme.of(
                                                                context)
                                                            .errorText,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        CustomTheme.of(context)
                                                            .backgroundColor,
                                                    suffixIcon: GestureDetector(
                                                      onTap: () {
                                                        controller
                                                                .isShowPassword
                                                                .value =
                                                            !controller
                                                                .isShowPassword
                                                                .value;
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .fromLTRB(
                                                                12, 14, 12, 14),
                                                        child: SvgPicture.asset(
                                                            controller
                                                                    .isShowPassword
                                                                    .value
                                                                ? "assets/images/eye close.svg"
                                                                : "assets/images/eye.svg",
                                                            height: 24,
                                                            width: 24),
                                                      ),
                                                    ),
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
                                                  keyboardType: TextInputType
                                                      .visiblePassword,
                                                  cursorColor:
                                                      CustomTheme.of(context)
                                                          .primaryTheme,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty ||
                                                        value.length < 8) {
                                                      return AppLocalizations
                                                              .of(context)
                                                          .getText(
                                                        'venjprs4' /* Please enter a valid password */,
                                                      );
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .getText(
                                                  'birthdate',
                                                ),
                                                style: CustomTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'SF Pro Text',
                                                      color: CustomTheme.of(
                                                              context)
                                                          .primaryTextColor,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 20.0),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color:
                                                        CustomTheme.of(context)
                                                            .black20,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      controller.birthdate
                                                          .toString()
                                                          .substring(0, 10),
                                                      style:
                                                          CustomTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Text',
                                                                color: CustomTheme.of(
                                                                        context)
                                                                    .primaryTextColor,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                    Container(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: CustomTheme.of(
                                                                context)
                                                            .backgroundColor,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Builder(
                                                        builder: (context) =>
                                                            InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () => controller
                                                                            .unfocusNode
                                                                            .canRequestFocus
                                                                        ? FocusScope.of(context).requestFocus(controller
                                                                            .unfocusNode)
                                                                        : FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        const SizedBox(
                                                                      height:
                                                                          536.0,
                                                                      child:
                                                                          DatePickerWidget(),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) {
                                                              safeSetState(
                                                                  () {});
                                                            });
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                            child: SvgPicture
                                                                .asset(
                                                              'assets/images/calender.svg',
                                                              width: 24.0,
                                                              height: 24.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(                       
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        AppLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'male',
                                                        ),
                                                        style: CustomTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'SF Pro Text',
                                                              color: CustomTheme
                                                                      .of(context)
                                                                  .primaryTextColor,
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                      VerticalDivider(),
                                                      InkWell(
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            isMale
                                                                ? check
                                                                : uncheck,
                                                            width: 24.0,
                                                            height: 24.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        onTap: () {
                                                          isMale = true;
                                                          setState(() {});
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        AppLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'female',
                                                        ),
                                                        style: CustomTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'SF Pro Text',
                                                              color: CustomTheme
                                                                      .of(context)
                                                                  .primaryTextColor,
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                      VerticalDivider(),
                                                      InkWell(
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            !isMale
                                                                ? check
                                                                : uncheck,
                                                            width: 24.0,
                                                            height: 24.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        onTap: () {
                                                          isMale = false;
                                                          setState(() {});
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 40.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (formKey2.currentState!
                                                          .validate() ||
                                                      controller.birthdate !=
                                                          null) {
                                                    authController.register(
                                                        controller
                                                            .textController1
                                                            .text,
                                                        controller
                                                            .textController11
                                                            .text,
                                                        controller
                                                            .textController6
                                                            .text,
                                                        controller
                                                            .textController3
                                                            .text,
                                                        controller
                                                            .textController2
                                                            .text,
                                                        isMale
                                                            ? Gender.male
                                                            : Gender.female,
                                                        controller.birthdate
                                                            .toString()
                                                            .substring(0, 10));
                                                  }
                                                },
                                                child: const CustomButtonWidget(
                                                  tittle: 'Sign Up',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  ListView(
                                    padding: const EdgeInsets.fromLTRB(
                                      0,
                                      32.0,
                                      0,
                                      32.0,
                                    ),
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Form(
                                        key: formKey1,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)
                                                  .getText(
                                                'email' /* Email */,
                                              ),
                                              style: CustomTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'SF Pro Text',
                                                    color:
                                                        CustomTheme.of(context)
                                                            .primaryTextColor,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 5.0, 0.0, 0.0),
                                              child: TextFormField(
                                                controller:
                                                    controller.textController4,
                                                focusNode: controller
                                                    .textFieldFocusNode4,
                                                textInputAction:
                                                    TextInputAction.next,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
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
                                                  hintText: AppLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'emailHint' /* example@example.com */,
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
                                                  errorStyle: CustomTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SF Pro Text',
                                                        color: CustomTheme.of(
                                                                context)
                                                            .errorText,
                                                        fontSize: 16.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: CustomTheme.of(
                                                              context)
                                                          .black20,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: CustomTheme.of(
                                                              context)
                                                          .primaryTheme,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: CustomTheme.of(
                                                              context)
                                                          .errorText,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: CustomTheme.of(
                                                              context)
                                                          .errorText,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      CustomTheme.of(context)
                                                          .backgroundColor,
                                                ),
                                                style: CustomTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'SF Pro Text',
                                                      color: CustomTheme.of(
                                                              context)
                                                          .primaryTextColor,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts: false,
                                                    ),
                                                cursorColor:
                                                    CustomTheme.of(context)
                                                        .primaryTheme,
                                                validator: (val) {
                                                  if (val == null ||
                                                      val.isEmpty ||
                                                      !GetUtils.isEmail(val)) {
                                                    return AppLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'validEmail' /* Please enter a valid email... */,
                                                    );
                                                  }

                                                  return null;
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .getText(
                                                  'xkrhvehx' /* Password */,
                                                ),
                                                style: CustomTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'SF Pro Text',
                                                      color: CustomTheme.of(
                                                              context)
                                                          .primaryTextColor,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 5.0, 0.0, 0.0),
                                              child: Obx(
                                                () => TextFormField(
                                                  controller: controller
                                                      .textController5,
                                                  focusNode: controller
                                                      .textFieldFocusNode5,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  obscureText: controller
                                                      .isShowPassword1.value,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        AppLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'jvxsknhk' /* Enter your password */,
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
                                                    errorStyle: CustomTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Text',
                                                          color: CustomTheme.of(
                                                                  context)
                                                              .errorText,
                                                          fontSize: 16.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: CustomTheme.of(
                                                                context)
                                                            .black20,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: CustomTheme.of(
                                                                context)
                                                            .primaryTheme,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: CustomTheme.of(
                                                                context)
                                                            .errorText,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: CustomTheme.of(
                                                                context)
                                                            .errorText,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        CustomTheme.of(context)
                                                            .backgroundColor,
                                                    suffixIcon: GestureDetector(
                                                      onTap: () {
                                                        controller
                                                                .isShowPassword1
                                                                .value =
                                                            !controller
                                                                .isShowPassword1
                                                                .value;
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .fromLTRB(
                                                                12, 14, 12, 14),
                                                        child: SvgPicture.asset(
                                                            controller
                                                                    .isShowPassword1
                                                                    .value
                                                                ? "assets/images/eye close.svg"
                                                                : "assets/images/eye.svg",
                                                            height: 24,
                                                            width: 24),
                                                      ),
                                                    ),
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
                                                  keyboardType: TextInputType
                                                      .visiblePassword,
                                                  cursorColor:
                                                      CustomTheme.of(context)
                                                          .primaryTheme,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty ||
                                                        value.length < 8) {
                                                      return AppLocalizations
                                                              .of(context)
                                                          .getText(
                                                        'ih689jgy' /* Please enter a valid password */,
                                                      );
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 40.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (formKey1.currentState ==
                                                          null ||
                                                      !formKey1.currentState!
                                                          .validate()) {
                                                    return;
                                                  }

                                                  authController.login(
                                                      controller
                                                          .textController4.text,
                                                      controller.textController5
                                                          .text);
                                                },
                                                child: const CustomButtonWidget(
                                                  tittle: 'Sign In',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
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
    );
  }
}
