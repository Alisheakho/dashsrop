import 'package:dash_drop/core/services/geolocator_services.dart';
import 'package:dash_drop/custom_widgets/custom_model.dart';
import 'package:dash_drop/pages/authentication/presentation/controller/auth_controller.dart';
import 'package:dash_drop/pages/home_screen/recent_activity.dart';
import 'package:dash_drop/pages/order/presentation/controller/reder_controller.dart';
import 'package:dash_drop/pages/receive_order/presentation/controller/receive_order_controller.dart';
import 'package:dash_drop/custom_widgets/show_dialog.dart';
import 'package:dash_drop/pages/send_order/presentation/components/sending_location_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:dash_drop/custom_widgets/custom_animations.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:dash_drop/pages/bottom_page/bottom_page_controller.dart';
import 'package:dash_drop/pages/home_screen/home_controller.dart';
import 'package:dash_drop/routes/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController controller = Get.put(HomePageController());
  final OrderController orderController = Get.find<OrderController>();
  HomepageLongContainerController homepageLongContainerController =
      Get.find<HomepageLongContainerController>();

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.linear,
          delay: 50.ms,
          duration: 400.ms,
          begin: const Offset(0.0, -10.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'listViewOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeOut,
          delay: 50.ms,
          duration: 400.ms,
          begin: const Offset(100.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'imageOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 500.ms,
          begin: 0.5,
          end: 1.0,
        ),
      ],
    ),
    'listViewOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeOut,
          delay: 50.ms,
          duration: 400.ms,
          begin: const Offset(100.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'imageOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 500.ms,
          begin: 0.5,
          end: 1.0,
        ),
      ],
    ),
    'imageOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 500.ms,
          begin: 0.5,
          end: 1.0,
        ),
      ],
    ),
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 500.ms,
          begin: 0.5,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    GeoService.to.requsetPermissions();
    orderController.fetchOrders();
    // controller.tabBarController = TabController(
    //   vsync: this,
    //   length: 2,
    //   initialIndex: 0,
    // )..addListener(() => setState(() {}));
    controller.textController ??= TextEditingController();
    controller.textFieldFocusNode ??= FocusNode();
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
      child: SafeArea(
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    20.0, 24.0, 20.0, 24.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            8.0, 0.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context).getText(
                                    'hello' /* Hello */,
                                  ) +
                                  AuthController.to.user.name,
                              maxLines: 1,
                              style:
                                  CustomTheme.of(context).bodyMedium.override(
                                        fontFamily: 'SF Pro Text',
                                        color: CustomTheme.of(context)
                                            .primaryTextColor,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
                                        lineHeight: 1.5,
                                      ),
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation']!),
                            Text(
                              AuthController.to.user.role,
                              maxLines: 1,
                              style:
                                  CustomTheme.of(context).bodyMedium.override(
                                        fontFamily: 'SF Pro Text',
                                        color: CustomTheme.of(context).black40,
                                        fontSize: 12.0,
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
                        Get.toNamed(AppRoutes.detailLocationScreenWidget);
                      },
                      child: Container(
                        width: 44.0,
                        height: 44.0,
                        decoration: BoxDecoration(
                          color: CustomTheme.of(context).black10,
                          shape: BoxShape.circle,
                        ),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: SvgPicture.asset(
                            'assets/images/search.svg',
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
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 170.0,
                  decoration: BoxDecoration(
                    color: CustomTheme.of(context).primaryTheme,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        20.0, 20.0, 20.0, 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context).getText(
                            '4531wmed' /* Track Your Package */,
                          ),
                          maxLines: 1,
                          style: CustomTheme.of(context).bodyMedium.override(
                                fontFamily: 'SF Pro Text',
                                color: CustomTheme.of(context).white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: false,
                                lineHeight: 1.5,
                              ),
                        ),
                        Text(
                          AppLocalizations.of(context).getText(
                            '06v5n4n3' /* Please enter your tracking num... */,
                          ),
                          maxLines: 1,
                          style: CustomTheme.of(context).bodyMedium.override(
                                fontFamily: 'SF Pro Text',
                                color: CustomTheme.of(context).white,
                                fontSize: 12.0,
                                useGoogleFonts: false,
                                lineHeight: 1.5,
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: CustomTheme.of(context).lightGray,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(16.0, 0.0, 0.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: SvgPicture.asset(
                                              'assets/images/search.svg',
                                              width: 24.0,
                                              height: 24.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        onTap: () async {
                                          // GeoService.to.requsetPermissions();
                                          if (controller.textController.text !=
                                              '') {
                                            ReceiveOrderController.to
                                                .receiveSenderLocation(
                                                    controller
                                                        .textController.text);
                                          }
                                        },
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(12.0, 0.0, 0.0, 0.0),
                                          child: TextFormField(
                                            controller:
                                                controller.textController,
                                            focusNode:
                                                controller.textFieldFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              'controller.textController',
                                              const Duration(milliseconds: 500),
                                              () async {
                                                if (controller
                                                        .textController.text ==
                                                    '') {}
                                              },
                                            ),
                                            onFieldSubmitted: (_) async {
                                              setState(() {
                                                AppState().addToSearchList(
                                                    controller
                                                        .textController.text);
                                              });
                                              setState(() {
                                                controller.textController
                                                    ?.clear();
                                              });
                                            },
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle: CustomTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'SF Pro Text',
                                                    color:
                                                        CustomTheme.of(context)
                                                            .black40,
                                                    fontSize: 16.0,
                                                    useGoogleFonts: false,
                                                  ),
                                              hintText:
                                                  AppLocalizations.of(context)
                                                      .getText(
                                                '1rzjcx2u' /* Enter track ID number */,
                                              ),
                                              hintStyle: CustomTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'SF Pro Text',
                                                    color:
                                                        CustomTheme.of(context)
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
                                                  color: CustomTheme.of(context)
                                                      .primaryTextColor,
                                                  fontSize: 16.0,
                                                  useGoogleFonts: false,
                                                ),
                                            cursorColor: CustomTheme.of(context)
                                                .primaryTheme,
                                            validator: controller
                                                .textControllerValidator
                                                ?.asValidator(context),
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
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(
                    0,
                    38.0,
                    0,
                    20.0,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          30.0, 0.0, 30.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              // Get.toNamed(
                              //   AppRoutes.checkRatesScreenWidget,
                              // );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 46.0,
                                  height: 46.0,
                                  decoration: BoxDecoration(
                                    color: CustomTheme.of(context).primaryTheme,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: CustomTheme.of(context)
                                          .secondaryTheme,
                                    ),
                                  ),
                                  alignment:
                                      const AlignmentDirectional(0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: SvgPicture.asset(
                                      'assets/images/Check_Rates_white.svg',
                                      width: 24.0,
                                      height: 24.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 0.0),
                                  child: Text(
                                    AppLocalizations.of(context).getText(
                                      '0kexy0fk' /* Check Rates */,
                                    ),
                                    maxLines: 1,
                                    style: CustomTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SF Pro Text',
                                          color: CustomTheme.of(context)
                                              .primaryTextColor,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              ShowDialog(
                                  dialogWidget:
                                      SendingingLocationDialogWidget());
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 46.0,
                                  height: 46.0,
                                  decoration: BoxDecoration(
                                    color: CustomTheme.of(context)
                                        .secondaryBackground,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: CustomTheme.of(context)
                                          .secondaryTheme,
                                    ),
                                  ),
                                  alignment:
                                      const AlignmentDirectional(0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: SvgPicture.asset(
                                      'assets/images/box-add.svg',
                                      width: 24.0,
                                      height: 24.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 0.0),
                                  child: Text(
                                    AppLocalizations.of(context).getText(
                                      'send' /* Send */,
                                    ),
                                    maxLines: 1,
                                    style: CustomTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SF Pro Text',
                                          color:
                                              CustomTheme.of(context).black40,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                homepageLongContainerController
                                    .selectIndex.value = 1;
                              });
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 46.0,
                                  height: 46.0,
                                  decoration: BoxDecoration(
                                    color: CustomTheme.of(context)
                                        .secondaryBackground,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: CustomTheme.of(context)
                                          .secondaryTheme,
                                    ),
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
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 0.0),
                                  child: Text(
                                    AppLocalizations.of(context).getText(
                                      'c5aff05j' /* Order */,
                                    ),
                                    maxLines: 1,
                                    style: CustomTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SF Pro Text',
                                          color:
                                              CustomTheme.of(context).black40,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                          lineHeight: 1.5,
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
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 16.0, 0.0, 16.0),
                      child: Text(
                        AppLocalizations.of(context).getText(
                          'ActivOrder' /* Services and Product */,
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
                    Builder(builder: (context) {
                      return orderController.obx(
                          (orderList) =>
                              RecentActivityOrder(orders: orderList!),
                          onLoading: Column(children: [
                            CircularProgressIndicator(),
                          ]), // عرض المؤشر عند التحميل
                          onError: (error) =>
                              Center(child: Text('Error: $error')),
                          onEmpty: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                'assets/images/No_Order_yet!.png',
                                fit: BoxFit.cover,
                              ),
                            ).animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation']!),
                          ));
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
