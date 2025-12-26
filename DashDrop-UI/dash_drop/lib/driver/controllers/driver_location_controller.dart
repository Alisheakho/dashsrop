import 'dart:async';
import 'package:dash_drop/core/services/geolocator_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverLocationController extends GetxController {
  final unfocusNode = FocusNode();

  final Completer<GoogleMapController> gMapsController = Completer();
  CameraPosition initLocation = const CameraPosition(
    target: LatLng(36.65240347861686, 37.11841128766537),
    zoom: 17.0,
  );

  RxList<Marker> markers = <Marker>[].obs;

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
        // tilt: 59.44,
        zoom: 16.15,
      );

      GoogleMapController controller = await gMapsController.future;
      await controller
          .animateCamera(CameraUpdate.newCameraPosition(currentPosition));

      markers.add(Marker(
        markerId: const MarkerId('driver'),
        position: LatLng(position.latitude, position.longitude),
      ));
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  @override
  void onReady() {
    super.onReady();
    goToYourLocation();
  }

  @override
  void dispose() {
    super.dispose();
    unfocusNode.dispose();
  }
}
