import 'dart:developer';

import 'package:get/get.dart';
import 'package:dash_drop/custom_widgets/phone_field/intl_phone_field.dart';

import '/components/custom_appbar_widget.dart';
import '/components/custom_button_widget.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:dash_drop/custom_widgets/custom_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'edit_profile_screen_model.dart';
export 'edit_profile_screen_model.dart';

class EditProfileScreenWidget extends StatefulWidget {
  const EditProfileScreenWidget({super.key});

  @override
  State<EditProfileScreenWidget> createState() =>
      _EditProfileScreenWidgetState();
}

class _EditProfileScreenWidgetState extends State<EditProfileScreenWidget> {
  EditProfileScreenController controller =
      Get.put(EditProfileScreenController());

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    controller.textController1 ??= TextEditingController();
    controller.textFieldFocusNode1 ??= FocusNode();

    controller.textController2 ??= TextEditingController();
    controller.textFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          controller.textController1?.text =
              AppLocalizations.of(context).getText(
            'mc2fdh9l' /* Mohamad Hadi */,
          );
        }));
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
                text: 'Edit Profile',
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(
                    0,
                    36.0,
                    0,
                    24.0,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 24.0),
                          child: Stack(
                            alignment: const AlignmentDirectional(1.0, 1.0),
                            children: [
                              Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: CustomTheme.of(context).secondaryTheme,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/Avatar.png',
                                    ).image,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(1.0, 1.0),
                                child: Container(
                                  width: 34.0,
                                  height: 34.0,
                                  decoration: BoxDecoration(
                                    color: CustomTheme.of(context).primaryTheme,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment:
                                      const AlignmentDirectional(0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/camera.png',
                                      width: 24.0,
                                      height: 24.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 0.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context).getText(
                              'ok7wbajv' /* Full name */,
                            ),
                            style: CustomTheme.of(context).bodyMedium.override(
                                  fontFamily: 'SF Pro Text',
                                  color:
                                      CustomTheme.of(context).primaryTextColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: false,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: controller.textController1,
                              focusNode: controller.textFieldFocusNode1,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: CustomTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'SF Pro Text',
                                      color: CustomTheme.of(context).black40,
                                      fontSize: 16.0,
                                      useGoogleFonts: false,
                                    ),
                                hintText: AppLocalizations.of(context).getText(
                                  'cw8plkq6' /* Enter your full name */,
                                ),
                                hintStyle: CustomTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'SF Pro Text',
                                      color: CustomTheme.of(context).black40,
                                      fontSize: 16.0,
                                      useGoogleFonts: false,
                                    ),
                                errorStyle: CustomTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'SF Pro Text',
                                      color: CustomTheme.of(context).errorText,
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
                                    color: CustomTheme.of(context).primaryTheme,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomTheme.of(context).errorText,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomTheme.of(context).errorText,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                filled: true,
                                fillColor:
                                    CustomTheme.of(context).backgroundColor,
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
                              cursorColor: CustomTheme.of(context).primaryTheme,
                              validator: controller.textController1Validator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              AppLocalizations.of(context).getText(
                                'a08c0dgx' /* Phone number */,
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
                            child: IntlPhoneField(
                              controller: controller.textController2,
                              focusNode: controller.textFieldFocusNode2,
                              initialCountryCode: 'TR',
                              disableLengthCheck: true,
                              showCountryFlag: false,
                              flagsButtonPadding: EdgeInsets.zero,
                              flagsButtonMargin:
                                  const EdgeInsets.only(left: 16, right: 0),
                              style:
                                  CustomTheme.of(context).bodyMedium.override(
                                        fontFamily: 'SF Pro Text',
                                        color: CustomTheme.of(context)
                                            .primaryTextColor,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                              dropdownTextStyle:
                                  CustomTheme.of(context).bodyMedium.override(
                                        fontFamily: 'SF Pro Text',
                                        color: CustomTheme.of(context)
                                            .primaryTextColor,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                              cursorColor: CustomTheme.of(context).primaryTheme,
                              dropdownIconPosition: IconPosition.trailing,
                              dropdownIcon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black),
                              dropdownDecoration: const BoxDecoration(),
                              validator: controller.textController2Validator
                                  .asValidator(context),
                              decoration: InputDecoration(
                                floatingLabelStyle:
                                    CustomTheme.of(context).bodyMedium.override(
                                          fontFamily: 'SF Pro Text',
                                          color: CustomTheme.of(context)
                                              .primaryTextColor,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: false,
                                        ),
                                contentPadding: EdgeInsets.zero,
                                hintText: AppLocalizations.of(context).getText(
                                  'y7sthw5y' /*  Enter phone number */,
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                  borderSide: BorderSide(
                                    color: CustomTheme.of(context).errorText,
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomTheme.of(context).black20,
                                    width: 1.0,
                                  ),
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                  borderSide: BorderSide(
                                    color: CustomTheme.of(context).errorText,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: CustomTheme.of(context)
                                        .primaryTextColor,
                                    width: 1,
                                  ),
                                ),
                              ),
                              onChanged: (phone) {
                                log(phone.completeNumber);
                              },
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                    Get.back();
                  },
                  child: const CustomButtonWidget(
                    tittle: 'Save Changes',
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
