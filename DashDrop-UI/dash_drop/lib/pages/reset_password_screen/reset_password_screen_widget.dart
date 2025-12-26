import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:dash_drop/pages/reset_password_screen/reset_password_screen_widget.dart';

import '/components/custom_appbar_widget.dart';
import '/components/custom_button_widget.dart';
import '/components/reset_password_dialog_widget.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

export 'reset_password_screen_model.dart';

class ResetPasswordScreenWidget extends StatefulWidget {
  const ResetPasswordScreenWidget({super.key});

  @override
  State<ResetPasswordScreenWidget> createState() =>
      _ResetPasswordScreenWidgetState();
}

class _ResetPasswordScreenWidgetState extends State<ResetPasswordScreenWidget> {
  ResetPasswordScreenController controller =
      Get.put(ResetPasswordScreenController());

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    controller.textController1 ??= TextEditingController();
    controller.textFieldFocusNode1 ??= FocusNode();

    controller.textController2 ??= TextEditingController();
    controller.textFieldFocusNode2 ??= FocusNode();
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
                text: 'Reset password',
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Text(
                                AppLocalizations.of(context).getText(
                                  'sty9xuul' /* New password */,
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
                                  controller: controller.textController1,
                                  focusNode: controller.textFieldFocusNode1,
                                  textInputAction: TextInputAction.next,
                                  obscureText: controller.isShowPassword.value,
                                  decoration: InputDecoration(
                                    hintText:
                                        AppLocalizations.of(context).getText(
                                      '0vmwaj1v' /* Enter new password */,
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
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return AppLocalizations.of(context)
                                          .getText(
                                        'utqobgt1' /* Please enter a valid new passw... */,
                                      );
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Text(
                                AppLocalizations.of(context).getText(
                                  '96lkbzmk' /* Confirm password */,
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
                                      'ig9u8cnx' /* Enter confirm password */,
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
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return AppLocalizations.of(context)
                                          .getText(
                                        'f98zsah1' /* Please enter a valid confirm p... */,
                                      );
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Builder(
                        builder: (context) => Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (controller.formKey.currentState == null ||
                                  !controller.formKey.currentState!
                                      .validate()) {
                                return;
                              }
                              if (controller.textController1.text ==
                                  controller.textController2.text) {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: const AlignmentDirectional(
                                              0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: GestureDetector(
                                        onTap: () => controller
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    controller.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child:
                                            const ResetPasswordDialogWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Please enter same password',
                                      style: TextStyle(
                                        fontFamily: 'SF Pro Text',
                                        color: CustomTheme.of(context)
                                            .primaryTextColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    duration:
                                        const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        CustomTheme.of(context).secondary,
                                  ),
                                );
                              }
                            },
                            child: const CustomButtonWidget(
                              tittle: 'Reset password',
                            ),
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
    );
  }
}
