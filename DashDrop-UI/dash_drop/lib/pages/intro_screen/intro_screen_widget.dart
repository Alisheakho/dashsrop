import 'package:get/get.dart';
import 'package:dash_drop/routes/app_routes.dart';

import '/components/custom_button_widget.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'intro_screen_model.dart';
export 'intro_screen_model.dart';

class IntroScreenWidget extends StatefulWidget {
  const IntroScreenWidget({super.key});

  @override
  State<IntroScreenWidget> createState() => _IntroScreenWidgetState();
}

class _IntroScreenWidgetState extends State<IntroScreenWidget> {
  OnboardingPageController controller = Get.put(OnboardingPageController());

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
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
        body: Stack(
          alignment: const AlignmentDirectional(0, 1),
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  PageView(
                    controller: controller.pageViewController ??=
                        PageController(initialPage: 0),
                    onPageChanged: (_) async {
                      setState(() {
                        AppState().introIndex = controller.pageViewCurrentIndex;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0),
                            child: Image.asset(
                              'assets/images/intro1.png',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 213),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 16, 0),
                                    child: Text(
                                      AppLocalizations.of(context).getText(
                                        'cbduz0nk' /* Speed & Accuracy */,
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      style: CustomTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Text',
                                            color: CustomTheme.of(context)
                                                .primaryTextColor,
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                            lineHeight: 1.5,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(0, 0.39),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 16, 20, 0),
                                    child: Text(
                                      AppLocalizations.of(context).getText(
                                        'bhomzb7p' /* The speed in receiving & deliv... */,
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: CustomTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Text',
                                            color:
                                                CustomTheme.of(context).black40,
                                            fontSize: 16,
                                            useGoogleFonts: false,
                                            lineHeight: 1.5,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0),
                            child: Image.asset(
                              'assets/images/intro2.png',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 213),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 16, 0),
                                    child: Text(
                                      AppLocalizations.of(context).getText(
                                        '1p2ipkfz' /* Delivery Anywhere */,
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      style: CustomTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Text',
                                            color: CustomTheme.of(context)
                                                .primaryTextColor,
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                            lineHeight: 1.5,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(0, 0.39),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 16, 20, 0),
                                    child: Text(
                                      AppLocalizations.of(context).getText(
                                        '8d3nia2f' /* We cover all governorates of E... */,
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: CustomTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Text',
                                            color:
                                                CustomTheme.of(context).black40,
                                            fontSize: 16,
                                            useGoogleFonts: false,
                                            lineHeight: 1.5,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0),
                            child: Image.asset(
                              'assets/images/intro3.png',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 213),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 16, 0),
                                    child: Text(
                                      AppLocalizations.of(context).getText(
                                        'xvztsm7d' /* Protection & Safety */,
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: CustomTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Text',
                                            color: CustomTheme.of(context)
                                                .primaryTextColor,
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                            lineHeight: 1.5,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(0, 0.39),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 16, 20, 0),
                                    child: Text(
                                      AppLocalizations.of(context).getText(
                                        'o010so3s' /* Protect your shipment from dam... */,
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: CustomTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Text',
                                            color:
                                                CustomTheme.of(context).black40,
                                            fontSize: 16,
                                            useGoogleFonts: false,
                                            lineHeight: 1.5,
                                          ),
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
                  Align(
                    alignment: const AlignmentDirectional(0, 1),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 161),
                      child: smooth_page_indicator.SmoothPageIndicator(
                        controller: controller.pageViewController ??=
                            PageController(initialPage: 0),
                        count: 3,
                        axisDirection: Axis.horizontal,
                        onDotClicked: (i) async {
                          await controller.pageViewController!.animateToPage(
                            i,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        effect: smooth_page_indicator.ExpandingDotsEffect(
                          expansionFactor: 3,
                          spacing: 8,
                          radius: 16,
                          dotWidth: 6,
                          dotHeight: 6,
                          dotColor: CustomTheme.of(context).black20,
                          activeDotColor: CustomTheme.of(context).primaryTheme,
                          paintStyle: PaintingStyle.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 80),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (AppState().introIndex == 2) {
                    setState(() {
                      AppState().intro = true;
                    });
                    Get.toNamed(
                      AppRoutes.loginScreenWidget,
                    );
                  } else {
                    await controller.pageViewController?.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }
                },
                child: CustomButtonWidget(
                  tittle: AppState().introIndex == 2 ? 'Get Started' : 'Next',
                ),
              ),
            ),
            Opacity(
              opacity: AppState().introIndex == 2 ? 0.0 : 1.0,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Get.toNamed(
                      AppRoutes.loginScreenWidget,
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context).getText(
                      'm12tv5vz' /* Skip */,
                    ),
                    style: CustomTheme.of(context).bodyMedium.override(
                          fontFamily: 'SF Pro Text',
                          color: CustomTheme.of(context).primaryTextColor,
                          fontSize: 16,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
