import 'dart:async';
import 'package:dash_drop/core/services/geolocator_services.dart';
import 'package:dash_drop/core/services/signalr_services.dart';
import 'package:dash_drop/core/utils/constances.dart';
import 'package:dash_drop/custom_widgets/lat_lng.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:lg_signalr_client/lg_signalr_client.dart';

class TrackLocationController extends GetxController {
  final unfocusNode = FocusNode();

  final Completer<GoogleMapController> gMapsController = Completer();
  Rx<CameraPosition> initLocation = const CameraPosition(
    target: LatLng(36.65240347861686, 37.11841128766537),
    zoom: 17.0,
  ).obs;

  RxList<Marker> markers = <Marker>[].obs;
  RxMap<PolylineId, Polyline> polylines = <PolylineId, Polyline>{}.obs;
  RxInt orderId = 0.obs;
  RxInt orderStatus = 3.obs;

  @override
  void onInit() {
    super.onInit();
    SignalrServices.to.hubConnection.start();
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
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  Future<void> drowPolyline(String poly) async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();

    List<PointLatLng> polylineResult = polylinePoints.decodePolyline(poly);

    PointLatLng point = polylineResult[(polylineResult.length / 2).round()];

    CameraPosition currentPosition = CameraPosition(
      target: LatLng(point.latitude, point.longitude),
      zoom: 15,
    );

    GoogleMapController controller = await gMapsController.future;
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(currentPosition));

    if (polylineResult.isNotEmpty) {
      polylineCoordinates.addAll(polylineResult
          .map((point) => LatLng(point.latitude, point.longitude)));
    } else {
      print('Error getting polyline: $polylineResult');
    }

    // markers.add(Marker(
    //   markerId: const MarkerId('sender'),
    //   position: LatLng(source.latitude, source.longitude),
    // ));

    PolylineId id = const PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: const Color(0xFFF57625),
      points: polylineCoordinates,
      width: 6,
    );

    polylines[id] = polyline;
    refresh();
  }

  void tackDriver() {
    if (orderId.value != 0) {
      if (SignalrServices.to.hubConnection.state ==
          HubConnectionState.Connected) {
        SignalrServices.to.joinToGroupAsync(orderId.value);
        SignalrServices.to.hubConnection.on('ReceiveNewLocation',
            (List<Object> prams) {
          if (prams.isNotEmpty) {
            String location = prams[0].toString();
            LatLng1 latlng = LatLng1.fromString(location);
            markers.add(Marker(
              markerId: const MarkerId('driver'),
              position: LatLng(latlng.latitude, latlng.longitude),
            ));
          }
        });
        SignalrServices.to.hubConnection.on('ReceiveNewStatus',
            (List<Object> prams) {
          if (prams.isNotEmpty) {
            int status = prams[0] as int;
            orderStatus.value = status;
            refresh();
          }
        });
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    unfocusNode.dispose();
    SignalrServices.to.leaveGroupAsync(orderId.value);
    SignalrServices.to.hubConnection.stop();
  }
}
