import 'package:dash_drop/core/services/signalr_services.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:dash_drop/driver/models/reciving.dart';
import 'package:dash_drop/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecivingWidget extends StatefulWidget {
  RecivingWidget({required this.reciving, super.key});

  final Reciving reciving;

  @override
  State<RecivingWidget> createState() => _RecivingWidgetState();
}

class _RecivingWidgetState extends State<RecivingWidget> {
  @override
  Widget build(BuildContext context) {
    var custmTheme = CustomTheme.of(context);
    var lang = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: custmTheme.lightGray,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 46.0,
                          height: 46.0,
                          decoration: BoxDecoration(
                            color: custmTheme.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: SvgPicture.asset(
                              //Express_Service_truck.svg
                              'assets/images/Profile_fill.svg',
                              width: 35.0,
                              height: 35.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${widget.reciving.deliveryOrder.reciverCustomer.firstName} ${widget.reciving.deliveryOrder.reciverCustomer.lastName}",
                                  maxLines: 1,
                                  style: custmTheme.bodyMedium.override(
                                    fontFamily: 'SF Pro Text',
                                    color: custmTheme.primaryTextColor,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                    lineHeight: 1.5,
                                  ),
                                ),
                                Text(
                                  widget.reciving.deliveryOrder.reciverCustomer
                                      .phoneNumber,
                                  maxLines: 1,
                                  style: custmTheme.bodyMedium.override(
                                    fontFamily: 'SF Pro Text',
                                    color: custmTheme.black40,
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              'assets/images/tracking_line.png',
                              width: 7.0,
                              height: 63.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 46.0,
                          height: 46.0,
                          decoration: BoxDecoration(
                            color: custmTheme.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: SvgPicture.asset(
                              //Express_Service_truck.svg
                              'assets/images/Profile_fill.svg',
                              width: 35.0,
                              height: 35.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${widget.reciving.deliveryOrder.senderCustomer.firstName} ${widget.reciving.deliveryOrder.senderCustomer.firstName}",
                                  maxLines: 1,
                                  style: custmTheme.bodyMedium.override(
                                    fontFamily: 'SF Pro Text',
                                    color: custmTheme.primaryTextColor,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                    lineHeight: 1.5,
                                  ),
                                ),
                                Text(
                                  widget.reciving.deliveryOrder.reciverCustomer
                                      .phoneNumber,
                                  maxLines: 1,
                                  style: custmTheme.bodyMedium.override(
                                    fontFamily: 'SF Pro Text',
                                    color: custmTheme.black40,
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
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          15.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                lang.getText(
                                  'paymentResponsibility' /* From */,
                                ),
                                maxLines: 1,
                                style: custmTheme.bodyMedium.override(
                                  fontFamily: 'SF Pro Text',
                                  color: custmTheme.black40,
                                  fontSize: 12.0,
                                  useGoogleFonts: false,
                                  lineHeight: 1.5,
                                ),
                              ),
                              Text(
                                widget.reciving.deliveryOrder
                                            .paymentResponsibility ==
                                        0
                                    ? 'sender'
                                    : "reciver",
                                maxLines: 1,
                                style: custmTheme.bodyMedium.override(
                                  fontFamily: 'SF Pro Text',
                                  color: custmTheme.primaryTextColor,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                  lineHeight: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          15.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                lang.getText(
                                  'extraProfitRate',
                                ),
                                maxLines: 1,
                                style: custmTheme.bodyMedium.override(
                                  fontFamily: 'SF Pro Text',
                                  color: custmTheme.black40,
                                  fontSize: 12.0,
                                  useGoogleFonts: false,
                                  lineHeight: 1.5,
                                ),
                              ),
                              Text(
                                '${widget.reciving.deliveryOrder.extraProfitRate}%',
                                maxLines: 1,
                                style: custmTheme.bodyMedium.override(
                                  fontFamily: 'SF Pro Text',
                                  color: custmTheme.primaryTextColor,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                  lineHeight: 1.5,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  lang.getText(
                                    'costs' /* Shipping to */,
                                  ),
                                  maxLines: 1,
                                  style: custmTheme.bodyMedium.override(
                                    fontFamily: 'SF Pro Text',
                                    color: custmTheme.black40,
                                    fontSize: 12.0,
                                    useGoogleFonts: false,
                                    lineHeight: 1.5,
                                  ),
                                ),
                                Text(
                                  '${widget.reciving.deliveryOrder.extraProfitRate}\$',
                                  maxLines: 1,
                                  style: custmTheme.bodyMedium.override(
                                    fontFamily: 'SF Pro Text',
                                    color: custmTheme.primaryTextColor,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          15.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                lang.getText(
                                  'estimatedTime' /* From */,
                                ),
                                maxLines: 1,
                                style: custmTheme.bodyMedium.override(
                                  fontFamily: 'SF Pro Text',
                                  color: custmTheme.black40,
                                  fontSize: 12.0,
                                  useGoogleFonts: false,
                                  lineHeight: 1.5,
                                ),
                              ),
                              Text(
                                widget.reciving.deliveryOrder.estimatedTime,
                                maxLines: 1,
                                style: custmTheme.bodyMedium.override(
                                  fontFamily: 'SF Pro Text',
                                  color: custmTheme.primaryTextColor,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                  lineHeight: 1.5,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  lang.getText(
                                    'pathLengthKm' /* Shipping to */,
                                  ),
                                  maxLines: 1,
                                  style: custmTheme.bodyMedium.override(
                                    fontFamily: 'SF Pro Text',
                                    color: custmTheme.black40,
                                    fontSize: 12.0,
                                    useGoogleFonts: false,
                                    lineHeight: 1.5,
                                  ),
                                ),
                                Text(
                                  '${widget.reciving.deliveryOrder.pathLengthKm} Km',
                                  maxLines: 1,
                                  style: custmTheme.bodyMedium.override(
                                    fontFamily: 'SF Pro Text',
                                    color: custmTheme.primaryTextColor,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
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
                    const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () async {
                          print("id reciv ${widget.reciving.id}");
                          if (await SignalrServices.to
                              .acceptDeliveryOfferAsync(widget.reciving.id)) {
                            await SignalrServices.to.joinToGroupAsync(
                                widget.reciving.deliveryOrder.id);
                            var prefs = await SharedPreferences.getInstance();
                            try {
                              await prefs.setString('deliveryOrderId',
                                  widget.reciving.deliveryOrder.id.toString());
                            } catch (e) {
                              print(e);
                            }
                            Get.offNamed(AppRoutes.destinationScreen,
                                arguments: widget.reciving);
                          } else {
                            Get.defaultDialog(title: "error");
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                custmTheme.primaryTheme)),
                        child: Text(
                          lang.getText('accept'),
                          style: TextStyle(color: custmTheme.accent4),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                          onPressed: () async {
                            print("id reciv ${widget.reciving.id}");
                            await SignalrServices.to
                                .declineDeliveryOfferAsync(widget.reciving.id);
                          },
                          child: Text(
                            lang.getText('denied'),
                            style: TextStyle(color: custmTheme.errorText),
                          )),
                    ),
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
