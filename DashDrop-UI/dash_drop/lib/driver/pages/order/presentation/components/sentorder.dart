import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/internationalization.dart';
import 'package:dash_drop/driver/pages/order/presentation/screens/detielsorder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:timeago/timeago.dart' as timeago;

class DriverSentOrders extends StatelessWidget {
  final List orderSent;
  

  DriverSentOrders({required this.orderSent});
  Widget build(BuildContext context) {
    
    // TODO: implement build
    return ListView.builder(
      itemCount: orderSent.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            print(orderSent[index]);
            Get.to(MyOrderDetilsDriverScreen(orderList: orderSent[index]));
          },
          child: Column(
            children: [
              index == 0
                  ? SizedBox(
                      height: 50,
                    )
                  : SizedBox(
                      height: 12,
                    ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFE4E4E4)),

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
                        '${timeago.format(DateTime.parse(orderSent[index]!.createdAt))}',
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
                  ? SizedBox(
                      height: 12,
                    )
                  : SizedBox(
                      height: 0,
                    )
            ],
          ),
        );
      },
    );
  }
}
