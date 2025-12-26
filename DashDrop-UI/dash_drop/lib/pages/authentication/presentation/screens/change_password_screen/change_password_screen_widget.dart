import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '/components/custom_appbar_widget.dart';
import '/components/custom_button_widget.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:dash_drop/custom_widgets/custom_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'change_password_screen_model.dart';
export 'change_password_screen_model.dart';

class ChangePasswordScreenWidget extends StatefulWidget {
  const ChangePasswordScreenWidget({super.key});

  @override
  State<ChangePasswordScreenWidget> createState() =>
      _ChangePasswordScreenWidgetState();
}

class _ChangePasswordScreenWidgetState
    extends State<ChangePasswordScreenWidget> {
  ChangePasswordScreenController controller =
      Get.put(ChangePasswordScreenController());

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    controller.textController1 ??= TextEditingController();
    controller.textFieldFocusNode1 ??= FocusNode();

    controller.textController2 ??= TextEditingController();
    controller.textFieldFocusNode2 ??= FocusNode();

    controller.textController3 ??= TextEditingController();
    controller.textFieldFocusNode3 ??= FocusNode();
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
                text: 'Change Password',
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      16.0, 0.0, 16.0, 0.0),
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(
                      0,
                      30.0,
                      0,
                      30.0,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Form(
                        key: controller.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context).getText(
                                's44avy3z' /* Old Password */,
                              ),
                              style:
                                  CustomTheme.of(context).bodyMedium.override(
                                        fontFamily: 'SF Pro Text',
                                        color: CustomTheme.of(context)
                                            .primaryTextColor,
                                        fontSize: 16.0,
                                        useGoogleFonts: false,
                                      ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Obx(
                                () => TextFormField(
                                  controller: controller.textController1,
                                  focusNode: controller.textFieldFocusNode1,
                                  textInputAction: TextInputAction.next,
                                  obscureText: controller.isShowPassword.value,
                                  decoration: InputDecoration(
                                    hintText:
                                        AppLocalizations.of(context).getText(
                                      'y59kifny' /* Enter old password */,
                                    ),
                                    hintStyle: CustomTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'SF Pro Text',
                                          color:
                                              CustomTheme.of(context).black40,
                                          fontSize: 16.0,
                                          useGoogleFonts: false,
                                        ),
                                    errorStyle: CustomTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SF Pro Text',
                                          color:
                                              CustomTheme.of(context).errorText,
                                          fontSize: 16.0,
                                          useGoogleFonts: false,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: CustomTheme.of(context).black20,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: CustomTheme.of(context)
                                            .primaryTheme,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            CustomTheme.of(context).errorText,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            CustomTheme.of(context).errorText,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor:
                                        CustomTheme.of(context).backgroundColor,
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        controller.isShowPassword.value =
                                            !controller.isShowPassword.value;
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            12, 14, 12, 14),
                                        child: SvgPicture.asset(
                                            controller.isShowPassword.value
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
                                        fontFamily: 'SF Pro Text',
                                        color: CustomTheme.of(context)
                                            .primaryTextColor,
                                        fontSize: 16.0,
                                        useGoogleFonts: false,
                                      ),
                                  keyboardType: TextInputType.visiblePassword,
                                  cursorColor:
                                      CustomTheme.of(context).primaryTheme,
                                  validator: controller.textController1Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Text(
                                AppLocalizations.of(context).getText(
                                  'lro8ztc1' /* New password */,
                                ),
                                style:
                                    CustomTheme.of(context).bodyMedium.override(
                                          fontFamily: 'SF Pro Text',
                                          color: CustomTheme.of(context)
                                              .primaryTextColor,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: false,
                                        ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Obx(
                                () => TextFormField(
                                  controller: controller.textController2,
                                  focusNode: controller.textFieldFocusNode2,
                                  textInputAction: TextInputAction.next,
                                  obscureText: controller.isShowPassword1.value,
                                  decoration: InputDecoration(
                                    hintText:
                                        AppLocalizations.of(context).getText(
                                      'iu6uua6t' /* Enter new password */,
                                    ),
                                    hintStyle: CustomTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'SF Pro Text',
                                          color:
                                              CustomTheme.of(context).black40,
                                          fontSize: 16.0,
                                          useGoogleFonts: false,
                                        ),
                                    errorStyle: CustomTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SF Pro Text',
                                          color:
                                              CustomTheme.of(context).errorText,
                                          fontSize: 16.0,
                                          useGoogleFonts: false,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: CustomTheme.of(context).black20,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: CustomTheme.of(context)
                                            .primaryTheme,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            CustomTheme.of(context).errorText,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            CustomTheme.of(context).errorText,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor:
                                        CustomTheme.of(context).backgroundColor,
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        controller.isShowPassword1.value =
                                            !controller.isShowPassword1.value;
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            12, 14, 12, 14),
                                        child: SvgPicture.asset(
                                            controller.isShowPassword1.value
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
                                        fontFamily: 'SF Pro Text',
                                        color: CustomTheme.of(context)
                                            .primaryTextColor,
                                        fontSize: 16.0,
                                        useGoogleFonts: false,
                                      ),
                                  keyboardType: TextInputType.visiblePassword,
                                  cursorColor:
                                      CustomTheme.of(context).primaryTheme,
                                  validator: controller.textController2Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Text(
                                AppLocalizations.of(context).getText(
                                  'htzdxc0j' /* Confirm password */,
                                ),
                                style:
                                    CustomTheme.of(context).bodyMedium.override(
                                          fontFamily: 'SF Pro Text',
                                          color: CustomTheme.of(context)
                                              .primaryTextColor,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: false,
                                        ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Obx(
                                () => TextFormField(
                                  controller: controller.textController3,
                                  focusNode: controller.textFieldFocusNode3,
                                  textInputAction: TextInputAction.next,
                                  obscureText: controller.isShowPassword2.value,
                                  decoration: InputDecoration(
                                    hintText:
                                        AppLocalizations.of(context).getText(
                                      'iu6uua6t' /* Enter new password */,
                                    ),
                                    hintStyle: CustomTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'SF Pro Text',
                                          color:
                                              CustomTheme.of(context).black40,
                                          fontSize: 16.0,
                                          useGoogleFonts: false,
                                        ),
                                    errorStyle: CustomTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SF Pro Text',
                                          color:
                                              CustomTheme.of(context).errorText,
                                          fontSize: 16.0,
                                          useGoogleFonts: false,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: CustomTheme.of(context).black20,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: CustomTheme.of(context)
                                            .primaryTheme,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            CustomTheme.of(context).errorText,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            CustomTheme.of(context).errorText,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor:
                                        CustomTheme.of(context).backgroundColor,
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        controller.isShowPassword2.value =
                                            !controller.isShowPassword2.value;
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            12, 14, 12, 14),
                                        child: SvgPicture.asset(
                                            controller.isShowPassword2.value
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
                                        fontFamily: 'SF Pro Text',
                                        color: CustomTheme.of(context)
                                            .primaryTextColor,
                                        fontSize: 16.0,
                                        useGoogleFonts: false,
                                      ),
                                  keyboardType: TextInputType.visiblePassword,
                                  cursorColor:
                                      CustomTheme.of(context).primaryTheme,
                                  validator: controller.textController3Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    20.0, 24.0, 20.0, 46.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (controller.formKey.currentState == null ||
                        !controller.formKey.currentState!.validate()) {
                      return;
                    }
                    if (controller.textController2.text ==
                        controller.textController3.text) {
                      Get.back();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Please enter same password',
                            style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: CustomTheme.of(context).primaryTextColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor: CustomTheme.of(context).secondary,
                        ),
                      );
                    }
                  },
                  child: const CustomButtonWidget(
                    tittle: 'Change Password',
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
