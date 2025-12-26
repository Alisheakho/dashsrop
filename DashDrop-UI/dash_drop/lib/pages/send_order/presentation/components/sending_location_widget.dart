import 'package:dash_drop/pages/send_order/presentation/controller/location_dialog_controller.dart';
import 'package:dash_drop/routes/app_routes.dart';
import 'package:get/get.dart';
import '../controller/send_order_controller.dart';
import '/components/dialog_button_widget.dart';
import 'package:dash_drop/custom_widgets/custom_animations.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SendingingLocationDialogWidget extends StatefulWidget {
  SendingingLocationDialogWidget({super.key});

  @override
  State<SendingingLocationDialogWidget> createState() =>
      _SendingingLocationDialogWidgetState();
}

class _SendingingLocationDialogWidgetState
    extends State<SendingingLocationDialogWidget> {
  SendingLocationController controller = Get.put(SendingLocationController());

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
    return Obx(() {
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
            padding:
                const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    AppLocalizations.of(context).getText(
                      'confirmYourLocation' /* Confirm Your Location */,
                    ),
                    maxLines: 1,
                    style: CustomTheme.of(context).bodyMedium.override(
                          fontFamily: 'SF Pro Text',
                          color: CustomTheme.of(context).primaryTextColor,
                          fontSize: () {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
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
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: CustomTheme.of(context).black10,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: controller.initLocation.value,
                        // myLocationButtonEnabled: true,
                        myLocationEnabled: true,
                        onMapCreated: (GoogleMapController mapController) {
                          print("Map ID: ${mapController.mapId}");
                          if (!controller.gMapsController.isCompleted) {
                            controller.gMapsController.complete(mapController);
                          }
                        },
                        onTap: (LatLng latlng) {
                          controller.setPoint(
                              LatLng1(latlng.latitude, latlng.longitude));
                          setState(() {});
                        },
                        markers: Set<Marker>.of(controller.markers),
                        polylines:
                            Set<Polyline>.of(controller.polylines.values)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: CustomTheme.of(context).black10,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          15.0, 0.0, 15.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            SendOrderController.to.createOrderModel.value
                                .sourceLocationDescription,
                            style: TextStyle(overflow: TextOverflow.ellipsis),
                          ),
                          IconButton(
                              onPressed: () async {
                                controller.goToYourLocation();
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.my_location_sharp,
                                color: CustomTheme.of(context).primaryTheme,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 10.0),
                  child: Text(
                    AppLocalizations.of(context).getText(
                      'manualyLacationDessi' /* Your account is ready to use.Y... */,
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: CustomTheme.of(context).bodyMedium.override(
                          fontFamily: 'SF Pro Text',
                          color: CustomTheme.of(context).black40,
                          fontSize: () {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return 12;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return 14;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return 16;
                            } else {
                              return 16;
                            }
                          }()
                              .toDouble(),
                          useGoogleFonts: false,
                          lineHeight: 1.5,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      40.0, 0.0, 40.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (SendOrderController
                              .to.createOrderModel.value.sourceLocation !=
                          '') {
                        Get.offNamed(AppRoutes.orderDetailScreenWidget);
                      } else {}
                    },
                    child: const DialogButtonWidget(
                      tittle: 'Continue',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
