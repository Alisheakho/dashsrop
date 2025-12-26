import 'package:dash_drop/custom_widgets/custom_animations.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:dash_drop/pages/order/presentation/screens/detielsorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

class SentOrders extends StatelessWidget {
   SentOrders({super.key, required this.orderSent});
  final List orderSent;

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
  Widget build(BuildContext context) {
    
    if (orderSent.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/No_Order_yet!.png',
                  fit: BoxFit.cover,
                ),
              ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Text(
              'No Sent Order yet!',
              maxLines: 1,
              style: CustomTheme.of(context).bodyMedium.override(
                    fontFamily: 'SF Pro Text',
                    color: CustomTheme.of(context).primaryTextColor,
                    fontSize: () {
                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                        return 22;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointMedium) {
                        return 24;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointLarge) {
                        return 26;
                      } else {
                        return 26;
                      }
                    }()
                        .toDouble(),
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: false,
                  ),
            ),
          ),
        ],
      );
    }

    return ListView.builder(
      itemCount: orderSent.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Get.to(MyOrderDetilsScreen(orderList: orderSent[index]));
          },
          child: Column(
            children: [
              index == 0
                  ? const SizedBox(
                      height: 50,
                    )
                  : const SizedBox(
                      height: 12,
                    ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE4E4E4)),

                  borderRadius: BorderRadius.circular(12), // نصف قطر الزوايا
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      10.0, 10.0, 20.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: CustomTheme.of(context).secondaryTheme,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        alignment: const AlignmentDirectional(0.0, 0.0),
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
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${orderSent[index].receivingCode}',
                                maxLines: 1,
                                style:
                                    CustomTheme.of(context).bodyMedium.override(
                                          fontFamily: 'SF Pro Text',
                                          color: CustomTheme.of(context)
                                              .primaryTextColor,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                          lineHeight: 1.5,
                                        ),
                              ),
                              Text(
                                AppLocalizations.of(context).getText(
                                  'moreDetails' /* Processed at sort facility */,
                                ),
                                maxLines: 1,
                                style: CustomTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'SF Pro Text',
                                      color: CustomTheme.of(context).black40,
                                      useGoogleFonts: false,
                                      lineHeight: 1.5,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        timeago.format(DateTime.parse(orderSent[index]!.createdAt)),
                        style: CustomTheme.of(context).bodyMedium.override(
                              fontFamily: 'SF Pro Text',
                              color: CustomTheme.of(context).black40,
                              fontSize: 12.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              index == orderSent.length - 1
                  ? const SizedBox(
                      height: 12,
                    )
                  : const SizedBox(
                      height: 0,
                    )
            ],
          ),
        );
      },
    );
  }
}
