// ignore_for_file: deprecated_member_use
import 'package:dash_drop/components/custom_button_widget.dart';
import 'package:dash_drop/core/utils/enums.dart';
import 'package:dash_drop/pages/authentication/presentation/controller/auth_controller.dart';
import 'package:dash_drop/pages/order/domain/entities/order.dart';
import 'package:dash_drop/pages/order/presentation/controller/reder_controller.dart';
import 'package:dash_drop/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:dash_drop/components/date_picker_dialog_widget.dart';
import 'package:dash_drop/custom_widgets/custom_animations.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:dash_drop/pages/bottom_page/bottom_page_controller.dart';
import 'package:dash_drop/pages/order/presentation/controller/my_order_controller.dart';

class MyOrderDetilsScreen extends StatefulWidget {
  BoxOrder? orderList;
  MyOrderDetilsScreen({super.key, this.orderList});
  @override
  State<MyOrderDetilsScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderDetilsScreen> {
  final OrderController orderController = Get.find<OrderController>();
  final List someDiteils = [
    'Sender',
    'Reciver',
    'Estimated',
    'price',
    'Sensitivity',
    'Pyment',
    'pathLength'
  ];
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
                              Get.back();
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: CustomTheme.of(context).backgroundColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color:
                                      CustomTheme.of(context).containerBorder,
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
                              'DetalisOrder' /* My Order */,
                            ),
                            textAlign: TextAlign.center,
                            style: CustomTheme.of(context).bodyMedium.override(
                                  fontFamily: 'SF Pro Text',
                                  color:
                                      CustomTheme.of(context).primaryTextColor,
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
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () => controller
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      controller.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 34.0, 0.0, 0.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: CustomTheme.of(context).lightGray,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 46.0,
                                            height: 46.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  CustomTheme.of(context).white,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            alignment:
                                                const AlignmentDirectional(
                                                    0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/box_package.svg',
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
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    AppLocalizations.of(context)
                                                        .getText(
                                                      'm1izn0fu' /* Smart Watch */,
                                                    ),
                                                    maxLines: 1,
                                                    style: CustomTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Text',
                                                          color: CustomTheme.of(
                                                                  context)
                                                              .primaryTextColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.5,
                                                        ),
                                                  ),
                                                  Text(
                                                    /*         AppLocalizations.of(context)
                                                        .getText(
                                                      'm1izn0fu' /* Tracking ID: #12394527 */,
                                                    ), */
                                                    '${widget.orderList!.receivingCode}',
                                                    maxLines: 1,
                                                    style: CustomTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Text',
                                                          color: CustomTheme.of(
                                                                  context)
                                                              .black40,
                                                          fontSize: 12.0,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.5,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 200.0,
                                      width: 500,
                                      child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10,
                                        ),
                                        itemCount: someDiteils.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            height: 5.0,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 255, 239, 229),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                  color: Colors.black26),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                          '${someDiteils[index]}',
                                                          style: TextStyle(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontSize: 11,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      index == 0
                                                          ? Text(
                                                              '${widget.orderList!.senderCustomer['firstName']}')
                                                          : index == 1
                                                              ? widget.orderList!
                                                                          .reciverCustomer !=
                                                                      null
                                                                  ? Text(
                                                                      '${widget.orderList!.reciverCustomer!['firstName']}')
                                                                  : Text(
                                                                      'no received')
                                                              : index == 2
                                                                  ? Text('${widget.orderList!.estimatedTime}'
                                                                      .substring(
                                                                          0, 8))
                                                                  : index == 3
                                                                      ? Text(
                                                                          '${widget.orderList?.deliveryCost!.toStringAsFixed(2)}')
                                                                      : index ==
                                                                              4
                                                                          ? Text(
                                                                              '${widget.orderList!.vehicleDetail != null ? SensitivityLevels.values[widget.orderList!.vehicleDetail!['sensitivityLevel']].name : Text('No driver')}')
                                                                          : index == 5
                                                                              ? Text('${widget.orderList!.paymentResponsibility == 0 ? widget.orderList!.senderCustomer['firstName'] : widget.orderList!.reciverCustomer!['firstName']}')
                                                                              : index == 6
                                                                                  ? Text('${widget.orderList!.pathLengthKm?.toStringAsFixed(3)}' + 'Km')
                                                                                  : Text('${widget.orderList!.offersCount}'),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.asset(
                                            'assets/images/tracking_line.png',
                                            width: 7.0,
                                            height: 63.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(15.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${AppLocalizations.of(context).getText(
                                                        '1ggmowto' /* From */,
                                                      )} ${widget.orderList?.senderCustomer['firstName']}',
                                                      maxLines: 1,
                                                      style: CustomTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'SF Pro Text',
                                                            color:
                                                                CustomTheme.of(
                                                                        context)
                                                                    .black40,
                                                            fontSize: 12.0,
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.5,
                                                          ),
                                                    ),
                                                    Text(
                                                      '${widget.orderList?.sourceLocationDescription}',
                                                      maxLines: 1,
                                                      style: CustomTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'SF Pro Text',
                                                            color: CustomTheme
                                                                    .of(context)
                                                                .primaryTextColor,
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.5,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 16.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${AppLocalizations.of(context).getText(
                                                          '84bm4ojg' /* Shipping to */,
                                                        )} ${widget.orderList!.reciverCustomer?['firstName']}',
                                                        maxLines: 1,
                                                        style: CustomTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'SF Pro Text',
                                                              color: CustomTheme
                                                                      .of(context)
                                                                  .black40,
                                                              fontSize: 12.0,
                                                              useGoogleFonts:
                                                                  false,
                                                              lineHeight: 1.5,
                                                            ),
                                                      ),
                                                      Text(
                                                        '${widget.orderList!.destinationLocationDescription}',
                                                        maxLines: 1,
                                                        style: CustomTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'SF Pro Text',
                                                              color: CustomTheme
                                                                      .of(context)
                                                                  .primaryTextColor,
                                                              fontSize: 12.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              useGoogleFonts:
                                                                  false,
                                                              lineHeight: 1.5,
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
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 16.0, 0.0, 0.0),
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: AppLocalizations.of(context)
                                                  .getText(
                                                'w6fc2w5r' /* Status :   */,
                                              ),
                                              style: CustomTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'SF Pro Text',
                                                    color:
                                                        CustomTheme.of(context)
                                                            .black40,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                            TextSpan(
                                              text: widget.orderList!.status ==
                                                      0
                                                  ? 'Yor order is Pendding'
                                                  : widget.orderList!.status ==
                                                          1
                                                      ? 'Yor order is  InShortWatingQueue'
                                                      : widget.orderList!
                                                                  .status ==
                                                              2
                                                          ? 'Yor order is  InLongWatingQueue'
                                                          : widget.orderList!
                                                                      .status ==
                                                                  3
                                                              ? 'Yor order is Accepted'
                                                              : widget.orderList!
                                                                          .status ==
                                                                      4
                                                                  ? 'Yor order is AtSourceLocation'
                                                                  : widget.orderList!
                                                                              .status ==
                                                                          5
                                                                      ? 'Yor order is Deliverring'
                                                                      : widget.orderList!.status ==
                                                                              6
                                                                          ? 'Yor order is AtDestinationLocation'
                                                                          : widget.orderList!.status == 7
                                                                              ? 'Yor order is Finished'
                                                                              : widget.orderList!.status == 8
                                                                                  ? 'Rejected'
                                                                                  : 'no statuse',
                                              style: const TextStyle(),
                                            )
                                          ],
                                          style: CustomTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'SF Pro Text',
                                                color: CustomTheme.of(context)
                                                    .primaryTextColor,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        textScaler: TextScaler.linear(
                                            MediaQuery.of(context)
                                                .textScaleFactor),
                                      ),
                                    ),
                                    widget.orderList!.status > 2 &&
                                            widget.orderList!.status < 7
                                        ? Align(
                                            alignment:
                                                const AlignmentDirectional(
                                                    0.0, 1.0),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      20.0, 24.0, 20.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  Get.toNamed(
                                                      AppRoutes
                                                          .detailLocationScreenWidget,
                                                      arguments:
                                                          widget.orderList);
                                                },
                                                child: const CustomButtonWidget(
                                                  tittle: 'Track The Order',
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100,
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
