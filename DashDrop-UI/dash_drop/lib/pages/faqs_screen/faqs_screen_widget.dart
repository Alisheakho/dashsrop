import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '/components/custom_appbar_widget.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:dash_drop/custom_widgets/custom_model.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'faqs_screen_model.dart';
export 'faqs_screen_model.dart';

class FaqsScreenWidget extends StatefulWidget {
  const FaqsScreenWidget({super.key});

  @override
  State<FaqsScreenWidget> createState() => _FaqsScreenWidgetState();
}

class _FaqsScreenWidgetState extends State<FaqsScreenWidget> {
  FaqsScreenController controller = Get.put(FaqsScreenController());

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    controller.textController ??= TextEditingController();
    controller.textFieldFocusNode ??= FocusNode();

    controller.expandableController1 =
        ExpandableController(initialExpanded: false);
    controller.expandableController2 =
        ExpandableController(initialExpanded: false);
    controller.expandableController3 =
        ExpandableController(initialExpanded: false);
    controller.expandableController4 =
        ExpandableController(initialExpanded: false);
    controller.expandableController5 =
        ExpandableController(initialExpanded: false);
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
                text: 'FAQs',
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 0.0),
                child: TextFormField(
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
                      '502rqki5' /* Search FAQs */,
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
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      20.0, 0.0, 20.0, 0.0),
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(
                      0,
                      24.0,
                      0,
                      24.0,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 16.0),
                        child: Text(
                          AppLocalizations.of(context).getText(
                            'pn48i90k' /* Popular Searched */,
                          ),
                          style: CustomTheme.of(context).bodyMedium.override(
                                fontFamily: 'SF Pro Text',
                                color: CustomTheme.of(context).primaryTextColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: CustomTheme.of(context).black10,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 8.0, 16.0, 8.0),
                            child: Container(
                              width: double.infinity,
                              color: CustomTheme.of(context).backgroundColor,
                              child: ExpandableNotifier(
                                controller: controller.expandableController1,
                                child: ExpandablePanel(
                                  header: Text(
                                    AppLocalizations.of(context).getText(
                                      'sp7p7l46' /* What does Shipping do? */,
                                    ),
                                    maxLines: 1,
                                    style: CustomTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'SF Pro Text',
                                          color: CustomTheme.of(context)
                                              .primaryTextColor,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  collapsed: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: CustomTheme.of(context)
                                          .backgroundColor,
                                    ),
                                  ),
                                  expanded: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppLocalizations.of(context).getText(
                                            'qa07g0qt' /* Amet minim mollit non deserunt... */,
                                          ),
                                          style: CustomTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'SF Pro Text',
                                                color: CustomTheme.of(context)
                                                    .black40,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: false,
                                                lineHeight: 1.5,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: true,
                                    expandIcon: Icons.add,
                                    collapseIcon: Icons.remove_sharp,
                                    iconColor:
                                        CustomTheme.of(context).primaryTheme,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: CustomTheme.of(context).black10,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 8.0, 16.0, 8.0),
                            child: Container(
                              width: double.infinity,
                              color: CustomTheme.of(context).backgroundColor,
                              child: ExpandableNotifier(
                                controller: controller.expandableController2,
                                child: ExpandablePanel(
                                  header: Text(
                                    AppLocalizations.of(context).getText(
                                      'hl81dbcf' /* What are custom shipping price... */,
                                    ),
                                    maxLines: 1,
                                    style: CustomTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'SF Pro Text',
                                          color: CustomTheme.of(context)
                                              .primaryTextColor,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  collapsed: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: CustomTheme.of(context)
                                          .backgroundColor,
                                    ),
                                  ),
                                  expanded: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 16.0),
                                        child: Text(
                                          AppLocalizations.of(context).getText(
                                            '32syxtfy' /* Amet minim mollit non deserunt... */,
                                          ),
                                          style: CustomTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'SF Pro Text',
                                                color: CustomTheme.of(context)
                                                    .black40,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: false,
                                                lineHeight: 1.5,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: true,
                                    expandIcon: Icons.add,
                                    collapseIcon: Icons.remove_sharp,
                                    iconColor:
                                        CustomTheme.of(context).primaryTheme,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: CustomTheme.of(context).black10,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 8.0, 16.0, 8.0),
                            child: Container(
                              width: double.infinity,
                              color: CustomTheme.of(context).backgroundColor,
                              child: ExpandableNotifier(
                                controller: controller.expandableController3,
                                child: ExpandablePanel(
                                  header: Text(
                                    AppLocalizations.of(context).getText(
                                      '6up9t2ii' /* How can I track my order? */,
                                    ),
                                    maxLines: 1,
                                    style: CustomTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'SF Pro Text',
                                          color: CustomTheme.of(context)
                                              .primaryTextColor,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  collapsed: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: CustomTheme.of(context)
                                          .backgroundColor,
                                    ),
                                  ),
                                  expanded: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 16.0),
                                        child: Text(
                                          AppLocalizations.of(context).getText(
                                            't4gixjlg' /* Amet minim mollit non deserunt... */,
                                          ),
                                          style: CustomTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'SF Pro Text',
                                                color: CustomTheme.of(context)
                                                    .black40,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: false,
                                                lineHeight: 1.5,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: true,
                                    expandIcon: Icons.add,
                                    collapseIcon: Icons.remove_sharp,
                                    iconColor:
                                        CustomTheme.of(context).primaryTheme,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: CustomTheme.of(context).black10,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 8.0, 16.0, 8.0),
                            child: Container(
                              width: double.infinity,
                              color: CustomTheme.of(context).backgroundColor,
                              child: ExpandableNotifier(
                                controller: controller.expandableController4,
                                child: ExpandablePanel(
                                  header: Text(
                                    AppLocalizations.of(context).getText(
                                      'bb8as7mb' /* I have received the incorrect ... */,
                                    ),
                                    maxLines: 1,
                                    style: CustomTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'SF Pro Text',
                                          color: CustomTheme.of(context)
                                              .primaryTextColor,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  collapsed: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: CustomTheme.of(context)
                                          .backgroundColor,
                                    ),
                                  ),
                                  expanded: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 16.0),
                                        child: Text(
                                          AppLocalizations.of(context).getText(
                                            '4okfpsy8' /* Amet minim mollit non deserunt... */,
                                          ),
                                          style: CustomTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'SF Pro Text',
                                                color: CustomTheme.of(context)
                                                    .black40,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: false,
                                                lineHeight: 1.5,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: true,
                                    expandIcon: Icons.add,
                                    collapseIcon: Icons.remove_sharp,
                                    iconColor:
                                        CustomTheme.of(context).primaryTheme,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 30.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: CustomTheme.of(context).black10,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 8.0, 16.0, 8.0),
                            child: Container(
                              width: double.infinity,
                              color: CustomTheme.of(context).backgroundColor,
                              child: ExpandableNotifier(
                                controller: controller.expandableController5,
                                child: ExpandablePanel(
                                  header: Text(
                                    AppLocalizations.of(context).getText(
                                      '9mfgs57o' /* How can I track my order? */,
                                    ),
                                    maxLines: 1,
                                    style: CustomTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'SF Pro Text',
                                          color: CustomTheme.of(context)
                                              .primaryTextColor,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  collapsed: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: CustomTheme.of(context)
                                          .backgroundColor,
                                    ),
                                  ),
                                  expanded: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 16.0),
                                        child: Text(
                                          AppLocalizations.of(context).getText(
                                            'dgjyuyqc' /* Amet minim mollit non deserunt... */,
                                          ),
                                          style: CustomTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'SF Pro Text',
                                                color: CustomTheme.of(context)
                                                    .black40,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: false,
                                                lineHeight: 1.5,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: true,
                                    expandIcon: Icons.add,
                                    collapseIcon: Icons.remove_sharp,
                                    iconColor:
                                        CustomTheme.of(context).primaryTheme,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 20.0),
                        child: InkWell(
                          onTap: () async {
                            Uri _url = Uri.parse('https://wa.me/+905344934844');
                            if (!await launchUrl(_url)) {
                              print('Could not launch $_url');
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 56.0,
                            decoration: BoxDecoration(
                              color: CustomTheme.of(context).primaryTheme,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: SvgPicture.asset(
                                    'assets/images/WhatsApp.svg',
                                    width: 24.0,
                                    height: 24.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    AppLocalizations.of(context).getText(
                                      'j4y7ds8g' /* Contact Via WhatsApp */,
                                    ),
                                    style: CustomTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SF Pro Text',
                                          color: CustomTheme.of(context).white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
