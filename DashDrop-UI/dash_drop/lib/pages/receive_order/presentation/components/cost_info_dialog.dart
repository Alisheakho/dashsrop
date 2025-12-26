import 'package:dash_drop/pages/receive_order/domain/entities/cost_info.dart';
import 'package:dash_drop/pages/receive_order/presentation/controller/location_dialog_model.dart';
import 'package:dash_drop/pages/receive_order/presentation/controller/receive_order_controller.dart';
import 'package:get/get.dart';
import '/components/dialog_button_widget.dart';
import 'package:dash_drop/custom_widgets/custom_animations.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CostInfoDialogWidget extends StatefulWidget {
  CostInfoDialogWidget({super.key});

  @override
  State<CostInfoDialogWidget> createState() => _CostInfoDialogWidgetState();
}

class _CostInfoDialogWidgetState extends State<CostInfoDialogWidget> {
  final animationsMap = {
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
    Get.delete<ReceivingLocationController>();
  }

  @override
  Widget build(BuildContext context) {
    CostInfo costInfo = ReceiveOrderController.to.costInfo.value;
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
      child: Container(
        width: () {
          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            return 414;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            return 424;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            return 434;
          } else {
            return 434;
          }
        }()
            .toDouble(),
        height: () {
          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            return 477;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            return 497;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            return 517;
          } else {
            return 517;
          }
        }()
            .toDouble(),
        decoration: BoxDecoration(
          color: CustomTheme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 15.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Get.back(),
                  )),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/signup_success.png',
                      fit: BoxFit.cover,
                    ),
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation']!),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            5.0, 0.0, 5.0, 0.0),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 239, 229),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: Colors.black26)),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Cost',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("\$${costInfo.cost}".substring(0, 5))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            5.0, 0.0, 5.0, 0.0),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 239, 229),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: Colors.black26)),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text('Payment',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              costInfo.paymentResponsibility == 0
                                  ? Text(costInfo.firstName)
                                  : const Text("You")
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            5.0, 0.0, 5.0, 0.0),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 239, 229),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: Colors.black26)),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Estimated',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(costInfo.estimatedTime.substring(0, 8))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                child: Text(
                  AppLocalizations.of(context).getText(
                    'confirmOrderdissi',
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: CustomTheme.of(context).bodyMedium.override(
                        fontFamily: 'SF Pro Text',
                        color: CustomTheme.of(context).black40,
                        fontSize: () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return 15;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return 18;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return 20;
                          } else {
                            return 24;
                          }
                        }()
                            .toDouble(),
                        useGoogleFonts: false,
                        lineHeight: 1.5,
                      ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Get.back();
                    ReceiveOrderController.to.confirmOrder();
                  },
                  child: const DialogButtonWidget(
                    tittle: 'Receive Now',
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
