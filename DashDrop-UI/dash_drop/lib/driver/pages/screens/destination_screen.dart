import 'dart:async';

import 'package:dash_drop/core/services/signalr_services.dart';
import 'package:dash_drop/core/utils/constances.dart';
import 'package:dash_drop/custom_widgets/custom_theme.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:dash_drop/driver/controllers/recivings_controller.dart';
import 'package:dash_drop/driver/models/deliveryOrder.dart';
import 'package:dash_drop/driver/models/reciving.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({super.key});

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  Reciving? reciving;

  static CameraPosition initLocation = const CameraPosition(
    target: LatLng(36.65240347861686, 37.11841128766537),
    zoom: 15.0,
  );

  final Completer<GoogleMapController> gMapsController = Completer();

  List<Marker> markers = [];

  Map<PolylineId, Polyline> polylines = {};

  Future<List<LatLng>> getPolylinePoints(
      LatLng1 source, LatLng1 destination) async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult polylineResult =
        await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: API_KEY_GOOGLE_MAPS,
      request: PolylineRequest(
        origin: PointLatLng(source.latitude, source.longitude),
        destination: PointLatLng(destination.latitude, destination.longitude),
        mode: TravelMode.driving,
      ),
    );

    if (polylineResult.points.isNotEmpty) {
      polylineCoordinates.addAll(polylineResult.points
          .map((point) => LatLng(point.latitude, point.longitude)));
    } else {
      print('Error getting polyline: ${polylineResult.errorMessage}');
    }

    markers.add(Marker(
      markerId: const MarkerId('sender'),
      position: LatLng(source.latitude, source.longitude),
    ));
    markers.add(Marker(
      markerId: const MarkerId('destination'),
      position: LatLng(destination.latitude, destination.longitude),
    ));

    CameraPosition currentPosition = CameraPosition(
      target: LatLng(source.latitude, source.longitude),
      // tilt: 59.44,
      zoom: 16.15,
    );

    GoogleMapController controller = await gMapsController.future;
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(currentPosition));

    return polylineCoordinates;
  }

  void _generatePolylineFromPoints(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: const Color(0xFFF57625),
      points: polylineCoordinates,
      width: 6,
    );

    polylines[id] = polyline;
  }

  void configPolyline() {
    DeliveryOrder locations = reciving!.deliveryOrder;

    LatLng1 source = LatLng1.fromString(locations.sourceLocation);
    LatLng1 destination = LatLng1.fromString(locations.destinationLocation);

    getPolylinePoints(LatLng1(source.latitude, source.longitude),
            LatLng1(destination.latitude, destination.longitude))
        .then((coordinates) {
      _generatePolylineFromPoints(coordinates);
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    if (Get.arguments != null) {
      reciving = Get.arguments as Reciving;
    } else {
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    configPolyline();
    HomepageLongRecivingController hPLRController =
        Get.find<HomepageLongRecivingController>();
    var custmTheme = CustomTheme.of(context);
    var lang = AppLocalizations.of(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Destinations'),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: InkWell(
                onTap: () {
                  SignalrServices.to
                      .emergencyFinishDelivering(reciving!.deliveryOrder.id);
                },
                child: const Icon(
                  Icons.question_mark,
                  size: 30.0,
                ),
              ),
            )
          ],
        ),
        body: Hero(
          tag: 'hero',
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
            child: Container(
              decoration: BoxDecoration(
                color: custmTheme.lightGray,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: initLocation,
                      myLocationButtonEnabled: true,
                      myLocationEnabled: true,
                      zoomControlsEnabled: false,
                      onMapCreated: (GoogleMapController mapController) {
                        // Get the MapId
                        print("Map ID: ${mapController.mapId}");
                        if (gMapsController.isCompleted) {
                          gMapsController.complete(mapController);
                        }
                      },
                      markers: markers.toSet(),
                      polylines: polylines.values.toSet(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        25.0, 15.0, 20.0, 5.0),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${reciving!.deliveryOrder.reciverCustomer.firstName} ${reciving!.deliveryOrder.reciverCustomer.lastName}",
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
                                      reciving!.deliveryOrder.reciverCustomer
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${reciving!.deliveryOrder.senderCustomer.firstName} ${reciving!.deliveryOrder.senderCustomer.firstName}",
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
                                      reciving!.deliveryOrder.reciverCustomer
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
                                    reciving!.deliveryOrder
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
                                    '${reciving!.deliveryOrder.extraProfitRate}%',
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
                                      '${reciving!.deliveryOrder.extraProfitRate}\$',
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
                                    reciving!.deliveryOrder.estimatedTime
                                        .substring(0, 8),
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
                                      '${reciving!.deliveryOrder.pathLengthKm} Km',
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
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 16.0, 0.0, 0.0),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            hPLRController.stateChange(
                                reciving!.deliveryOrder.id,
                                reciving!.deliveryOrder.receivingCode);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 56.0,
                            decoration: BoxDecoration(
                              color: CustomTheme.of(context).primaryTheme,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Obx(
                                () => Text(
                                  hPLRController.destinationStatus.value.name,
                                  style: CustomTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Text',
                                        color: CustomTheme.of(context).white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
