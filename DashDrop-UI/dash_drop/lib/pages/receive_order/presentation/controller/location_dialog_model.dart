import 'dart:async';
import 'package:dash_drop/core/services/geolocator_services.dart';
import 'package:dash_drop/core/utils/constances.dart';
import 'package:dash_drop/custom_widgets/lat_lng.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import 'receive_order_controller.dart';

class ReceivingLocationController extends GetxController {

  final Completer<GoogleMapController> gMapsController = Completer();
  Rx<CameraPosition> initLocation = const CameraPosition(
    target: LatLng(36.65240347861686, 37.11841128766537),
    zoom: 17.0,
  ).obs;

  RxList<Marker> markers = <Marker>[].obs;
  RxMap<PolylineId, Polyline> polylines = <PolylineId, Polyline>{}.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize default markers or settings if needed
  }

  Future<void> goToYourLocation() async {
    try {
      Position position = await GeoService.to.getCurrentPosition();
      print('${position.latitude} ${position.longitude}');

      CameraPosition currentPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        tilt: 59.44,
        zoom: 18.15,
      );

      GoogleMapController controller = await gMapsController.future;
      await controller
          .animateCamera(CameraUpdate.newCameraPosition(currentPosition));

      markers.add(Marker(
        markerId: const MarkerId('receiver'),
        position: LatLng(position.latitude, position.longitude),
      ));

      List<LatLng> polylinePoints = await getPolylinePoints(
          LatLng1(position.latitude, position.longitude));
      _generatePolylineFromPoints(polylinePoints);
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  Future<List<LatLng>> getPolylinePoints(LatLng1 destination) async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    LatLng1 senderLocation =
        ReceiveOrderController.to.senderLocation.value.sourceLocation;

    PolylineResult polylineResult =
        await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: API_KEY_GOOGLE_MAPS,
      request: PolylineRequest(
        origin: PointLatLng(senderLocation.latitude, senderLocation.longitude),
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
    ReceiveOrderController.to.overviewPolyline.value = polylineResult.overviewPolyline!;
    ReceiveOrderController.to.receiverAddress.value = polylineResult.endAddress!;
    ReceiveOrderController.to.pathLength.value = polylineResult.distanceValues!.first;
    ReceiveOrderController.to.destinationLocation.value = destination.serialize();

    markers.add(Marker(
      markerId: const MarkerId('sender'),
      position: LatLng(senderLocation.latitude, senderLocation.longitude),
    ));

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

  void setPoint(LatLng1 latlng) {
    markers.add(Marker(
      markerId: const MarkerId('receiver'),
      position: LatLng(latlng.latitude, latlng.longitude),
    ));

    getPolylinePoints(LatLng1(latlng.latitude, latlng.longitude))
        .then((coordinates) {
      _generatePolylineFromPoints(coordinates);
    });
  }
}
