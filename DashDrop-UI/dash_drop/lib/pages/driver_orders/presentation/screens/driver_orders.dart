// ignore_for_file: deprecated_member_use
import 'package:dash_drop/pages/authentication/presentation/controller/auth_controller.dart';
import 'package:dash_drop/pages/driver_orders/presentation/components/historyorder.dart';
import 'package:dash_drop/pages/driver_orders/presentation/components/recevedorder.dart';
import 'package:dash_drop/pages/driver_orders/presentation/components/sentorder.dart';
import 'package:dash_drop/pages/driver_orders/presentation/controller/driverOeder_controller.dart';
import 'package:dash_drop/pages/order/presentation/controller/my_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:dash_drop/components/date_picker_dialog_widget.dart';
import 'package:dash_drop/custom_widgets/custom_animations.dart';
import 'package:dash_drop/custom_widgets/custom_button_tabbar.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:dash_drop/pages/bottom_page/bottom_page_controller.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen>
    with TickerProviderStateMixin {
  final  DriverOrderController orderController = Get.find<DriverOrderController>();
  MyOrderController controller = Get.put(MyOrderController());
  HomepageLongContainerController homepageLongContainerController =
      Get.put(HomepageLongContainerController());
  Future<void>? orders;
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
  };

  @override
  void initState() {
    super.initState();
    orderController.fetchOrders();
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
    int currentUserId = AuthController.to.user.id;

    return Scaffold(
      body: GestureDetector(
        onTap: () => controller.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(controller.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: SafeArea(
          top: true,
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
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 79.0,
                    decoration: const BoxDecoration(),
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                homepageLongContainerController
                                    .selectIndex.value = 0;
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: CustomTheme.of(context).backgroundColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: CustomTheme.of(context).containerBorder,
                                ),
                              ),
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: SvgPicture.asset(
                                  'assets/images/Arrow_back.svg',
                                  width: 24.0,
                                  height: 24.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            AppLocalizations.of(context).getText(
                              'q47e3jt1' /* My Order */,
                            ),
                            textAlign: TextAlign.center,
                            style: CustomTheme.of(context).bodyMedium.override(
                                  fontFamily: 'SF Pro Text',
                                  color: CustomTheme.of(context).primaryTextColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                  lineHeight: 1.5,
                                ),
                          ),
                          Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: CustomTheme.of(context).backgroundColor,
                              shape: BoxShape.circle,
                            ),
                            alignment: const AlignmentDirectional(1.0, 0.0),
                            child: Builder(
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
                                                0.0, 0.0)
                                            .resolve(Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () => controller
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      controller.unfocusNode)
                                              : FocusScope.of(context).unfocus(),
                                          child: const SizedBox(
                                            height: 536.0,
                                            child: DatePickerDialogWidget(),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: SvgPicture.asset(
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
                                        'send' /* Upcoming */,
                                      ),
                                    ),
                                    Tab(
                                      text: AppLocalizations.of(context).getText(
                                        'receve' /* History */,
                                      ),
                                    ),
                                    Tab(
                                        text: AppLocalizations.of(context)
                                            .getText('j5rol10o' /* History */)),
                                  ],
                                  controller: controller.tabviewController,
                                  onTap: (i) async {
                                    [() async {}, () async {}, () async {}][i]();
                                  },
                                ),
                              ),
                              Builder(builder: (context) {
                                return orderController.obx(
                                  (orderList) => Expanded(
                                 
                                    child: TabBarView(
                                      controller: controller.tabviewController,
                                      children: [
                                        Builder(builder: (context) {
                                          final ordersent = orderList!
                                              .where((order) =>
                                                  order.senderCustomer['id'] ==
                                                  currentUserId)
                                              .toList();
                                      
                                          return DriverSentOrders(orderSent: ordersent);
                                        }),
                                        Builder(builder: (context) {
                                      
                                               final orderReceivede = orderList!
                                              .where((order) =>
                                                  order.senderCustomer['id'] !=
                                                  currentUserId)
                                              .toList();
                                          return DriverReceivedOrders(
                                              orderReceived:orderReceivede );
                                        }),
                                        Builder(
                                          builder: (context) {
                                            return DriverHistoryOrders(historyorder:orderList!);
                                       
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  onLoading: Column(children: [
                                    CircularProgressIndicator(),
                                  ]), // عرض المؤشر عند التحميل
                                  onError: (error) =>
                                      Center(child: Text('Error: $error')),
                                );
                              }),
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
      ),
    );
  }
}
