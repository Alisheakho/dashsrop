import 'package:dash_drop/custom_widgets/custom_animations.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:dash_drop/custom_widgets/internationalization.dart';
import 'package:dash_drop/pages/order/domain/entities/order.dart';
import 'package:dash_drop/pages/order/presentation/screens/detielsorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

class RecentActivityOrder extends StatelessWidget {
  RecentActivityOrder({super.key, required this.orders});
  final List orders;

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

  List t() {
    List filteredOrders = orders
        .where((order) =>
            order.status == 3 ||
            order.status == 4 ||
            order.status == 5 ||
            order.status == 6)
        .toList();
    filteredOrders.sort((a, b) => b.DateTime.parse('${b.createdAt}')
        .compareTo(a.DateTime.parse('${a.createdAt}')));
    List lastThreeOrders = filteredOrders.take(3).toList();
    return lastThreeOrders;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (t().length == 1)
          buildWidgets(context, t()[0])
        else if (t().length == 2) ...[
          buildWidgets(context, t()[0]),
          buildWidgets(context, t()[1]),
        ] else if (t().length >= 3) ...[
          buildWidgets(context, t()[0]),
          buildWidgets(context, t()[1]),
          buildWidgets(context, t()[2]),
        ] else ...[
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
              'No Order yet!',
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
        ]
      ],
    );
  }

  Widget buildWidgets(BuildContext context, BoxOrder order) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          // print(order);
          Get.to(MyOrderDetilsScreen(orderList: order));
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: CustomTheme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: CustomTheme.of(context).black10,
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 20.0, 10.0),
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
                          '${order.receivingCode}',
                          maxLines: 1,
                          style: CustomTheme.of(context).bodyMedium.override(
                                fontFamily: 'SF Pro Text',
                                color: CustomTheme.of(context).primaryTextColor,
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
                          style: CustomTheme.of(context).bodyMedium.override(
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
                  timeago.format(DateTime.parse(order.createdAt!)),
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
      ),
    );
  }
}
