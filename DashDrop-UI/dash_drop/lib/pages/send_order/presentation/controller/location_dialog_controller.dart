import 'dart:async';
import 'package:dash_drop/core/services/geolocator_services.dart';
import 'package:dash_drop/custom_widgets/lat_lng.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'send_order_controller.dart';

class SendingLocationController extends GetxController {
  final Completer<GoogleMapController> gMapsController = Completer();
  Rx<CameraPosition> initLocation = const CameraPosition(
    target: LatLng(36.65240347861686, 37.11841128766537),
    zoom: 17.0,
  ).obs;

  RxList<Marker> markers = <Marker>[].obs;
  RxMap<PolylineId, Polyline> polylines = <PolylineId, Polyline>{}.obs;

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
      SendOrderController.to.createOrderModel.value.sourceLocation =
          "${position.latitude},${position.longitude}";
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  void setPoint(LatLng1 latlng) {
    markers.add(Marker(
      markerId: const MarkerId('receiver'),
      position: LatLng(latlng.latitude, latlng.longitude),
    ));
    SendOrderController.to.createOrderModel.value.sourceLocation =
        latlng.serialize();
    refresh();
    print(latlng.serialize());
  }

  @override
  void dispose() {
    super.dispose();
  }
}
