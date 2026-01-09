import 'package:dash_drop/pages/authentication/presentation/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:dash_drop/components/logout_dialog_widget.dart';
import 'package:dash_drop/custom_widgets/custom_language_selector.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:dash_drop/pages/bottom_page/bottom_page_controller.dart';
import 'package:dash_drop/pages/profile_screen/profile_controller.dart';
import 'package:dash_drop/routes/app_routes.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({super.key});

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  ProfilePageController controller = Get.put(ProfilePageController());
  HomepageLongContainerController homepageLongContainerController = Get.put(
    HomepageLongContainerController(),
  );
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
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: CustomTheme.of(context).backgroundColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 194.0,
              decoration: BoxDecoration(
                color: CustomTheme.of(context).backgroundColor,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/profile_background.png',
                  ).image,
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                  0.0,
                  60.0,
                  0.0,
                  30.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        AppLocalizations.of(
                          context,
                        ).getText('53fzj50m' /* My Profile */),
                        style: CustomTheme.of(context).bodyMedium.override(
                          fontFamily: 'SF Pro Text',
                          color: CustomTheme.of(context).white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        20.0,
                        0.0,
                        20.0,
                        0.0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 44.0,
                            height: 44.0,
                            decoration: BoxDecoration(
                              color: CustomTheme.of(context).backgroundColor,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/Avatar.png',
                                ).image,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                14.0,
                                0.0,
                                14.0,
                                0.0,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AuthController.to.user.name,
                                    maxLines: 1,
                                    style: CustomTheme.of(context).bodyMedium
                                        .override(
                                          fontFamily: 'SF Pro Text',
                                          color: CustomTheme.of(context).white,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                  Text(
                                    AuthController.to.user.text,
                                    maxLines: 1,
                                    style: CustomTheme.of(context).bodyMedium
                                        .override(
                                          fontFamily: 'SF Pro Text',
                                          color: CustomTheme.of(context).white,
                                          useGoogleFonts: false,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              Get.toNamed(AppRoutes.editProfileScreenWidget);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: CustomTheme.of(context).containerBorder,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0,
                                  6.0,
                                  12.0,
                                  6.0,
                                ),
                                child: Text(
                                  AppLocalizations.of(
                                    context,
                                  ).getText('maazto0d' /* Edit Profile */),
                                  style: CustomTheme.of(context).bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Text',
                                        color: CustomTheme.of(
                                          context,
                                        ).primaryTextColor,
                                        useGoogleFonts: false,
                                      ),
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
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                  20.0,
                  0.0,
                  20.0,
                  0.0,
                ),
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(0, 24.0, 0, 24.0),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        0.0,
                        0.0,
                        20.0,
                      ),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Get.toNamed(AppRoutes.changePasswordScreenWidget);
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: CustomTheme.of(context).lightGray,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0,
                              16.0,
                              16.0,
                              16.0,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: SvgPicture.asset(
                                    'assets/images/Change_Password_img.svg',
                                    width: 24.0,
                                    height: 24.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          16.0,
                                          0.0,
                                          0.0,
                                          0.0,
                                        ),
                                    child: Text(
                                      AppLocalizations.of(context).getText(
                                        'mnpn8f1j' /* Change Password */,
                                      ),
                                      style: CustomTheme.of(context).bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Text',
                                            color: CustomTheme.of(
                                              context,
                                            ).primaryTextColor,
                                            fontSize: 16.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: SvgPicture.asset(
                                    'assets/images/arrow_right.svg',
                                    width: 20.0,
                                    height: 20.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        0.0,
                        0.0,
                        20.0,
                      ),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Get.toNamed(AppRoutes.faqsScreenWidget);
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: CustomTheme.of(context).lightGray,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0,
                              16.0,
                              16.0,
                              16.0,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: SvgPicture.asset(
                                    'assets/images/FAQs_img.svg',
                                    width: 24.0,
                                    height: 24.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          16.0,
                                          0.0,
                                          0.0,
                                          0.0,
                                        ),
                                    child: Text(
                                      AppLocalizations.of(
                                        context,
                                      ).getText('qhejjv5f' /* FAQs */),
                                      style: CustomTheme.of(context).bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Text',
                                            color: CustomTheme.of(
                                              context,
                                            ).primaryTextColor,
                                            fontSize: 16.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: SvgPicture.asset(
                                    'assets/images/arrow_right.svg',
                                    width: 20.0,
                                    height: 20.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        0.0,
                        0.0,
                        20.0,
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: CustomTheme.of(context).lightGray,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0,
                            16.0,
                            16.0,
                            16.0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: SvgPicture.asset(
                                  'assets/images/privacy_policy_img.svg',
                                  width: 24.0,
                                  height: 24.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                  ),
                                  child: Text(
                                    AppLocalizations.of(
                                      context,
                                    ).getText('lifdjqf3' /* Privacy Policy */),
                                    style: CustomTheme.of(context).bodyMedium
                                        .override(
                                          fontFamily: 'SF Pro Text',
                                          color: CustomTheme.of(
                                            context,
                                          ).primaryTextColor,
                                          fontSize: 16.0,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: SvgPicture.asset(
                                  'assets/images/arrow_right.svg',
                                  width: 20.0,
                                  height: 20.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        0.0,
                        0.0,
                        20.0,
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: CustomTheme.of(context).lightGray,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0,
                            16.0,
                            16.0,
                            16.0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: SvgPicture.asset(
                                  'assets/images/share_img.svg',
                                  width: 24.0,
                                  height: 24.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                  ),
                                  child: Text(
                                    AppLocalizations.of(
                                      context,
                                    ).getText('80twuagy' /* Share */),
                                    style: CustomTheme.of(context).bodyMedium
                                        .override(
                                          fontFamily: 'SF Pro Text',
                                          color: CustomTheme.of(
                                            context,
                                          ).primaryTextColor,
                                          fontSize: 16.0,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: SvgPicture.asset(
                                  'assets/images/arrow_right.svg',
                                  width: 20.0,
                                  height: 20.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        0.0,
                        0.0,
                        20.0,
                      ),
                      child: CustomLanguageSelector(
                        width: double.infinity,
                        height: 56.0,
                        backgroundColor: CustomTheme.of(
                          context,
                        ).backgroundColor,
                        dropdownColor: CustomTheme.of(context).backgroundColor,
                        dropdownIconColor: CustomTheme.of(
                          context,
                        ).primaryTextColor,
                        borderRadius: 12.0,
                        textStyle: TextStyle(
                          fontFamily: 'SF Pro Text',
                          color: CustomTheme.of(context).primaryTextColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                        ),
                        hideFlags: false,
                        flagSize: 22.0,
                        flagTextGap: 8.0,
                        currentLanguage: AppLocalizations.of(
                          context,
                        ).languageCode,
                        languages: AppLocalizations.languages(),
                        onChanged: (lang) => setAppLanguage(context, lang),
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
                                alignment: const AlignmentDirectional(
                                  0.0,
                                  0.0,
                                ).resolve(Directionality.of(context)),
                                child: GestureDetector(
                                  onTap: () =>
                                      controller.unfocusNode.canRequestFocus
                                      ? FocusScope.of(
                                          context,
                                        ).requestFocus(controller.unfocusNode)
                                      : FocusScope.of(context).unfocus(),
                                  child: const LogoutDialogWidget(),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: CustomTheme.of(context).lightGray,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0,
                              16.0,
                              16.0,
                              16.0,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: SvgPicture.asset(
                                    'assets/images/logout_img.svg',
                                    width: 24.0,
                                    height: 24.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          16.0,
                                          0.0,
                                          0.0,
                                          0.0,
                                        ),
                                    child: Text(
                                      AppLocalizations.of(
                                        context,
                                      ).getText('f1orjahy' /* Logout */),
                                      style: CustomTheme.of(context).bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Text',
                                            color: CustomTheme.of(
                                              context,
                                            ).primaryTextColor,
                                            fontSize: 16.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: SvgPicture.asset(
                                    'assets/images/arrow_right.svg',
                                    width: 20.0,
                                    height: 20.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
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
          ],
        ),
      ),
    );
  }
}
