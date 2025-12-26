import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GeoService extends GetxService {
  late LocationSettings _locationSettings;
  late LocationPermission permission;

  static GeoService get to => Get.find<GeoService>();

  Future<GeoService> init() async {
     permission = await Geolocator.checkPermission();

    if (GetPlatform.isAndroid) {
      _locationSettings = AndroidSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
        // intervalDuration: const Duration(seconds: 1),
        //(Optional) Set foreground notification config to keep the app alive
        //when going to the background
        // foregroundNotificationConfig: const ForegroundNotificationConfig(
        //   notificationText:
        //       "Example app will continue to receive your location even when you aren't using it",
        //   notificationTitle: "Running in Background",
        //   enableWakeLock: true,
        // )
      );
    } else if (GetPlatform.isIOS || GetPlatform.isMacOS) {
      _locationSettings = AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.fitness,
        distanceFilter: 10,
        pauseLocationUpdatesAutomatically: true,
        // Only set to true if our app will be started up in the background.
        showBackgroundLocationIndicator: false,
      );
    } else if (GetPlatform.isWeb) {
      _locationSettings = WebSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
        maximumAge: const Duration(minutes: 5),
      );
    } else {
      _locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      );
    }
    return this;
  }

  void requsetPermissions() async {
    bool serviceEnabled;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.deniedForever) {
      Get.defaultDialog(
        title: 'Locations',
        content: const Text(
            'Location permissions are permanently denied, we cannot request permissions.'),
        cancel: ElevatedButton(
            onPressed: () => Get.back(), child: const Text('cancel')),
        onConfirm: () async => await Geolocator.openAppSettings(),
      );
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.defaultDialog(
          title: 'Locations',
          content: const Text('Location permissions are denied'),
          onConfirm: () async => await Geolocator.openAppSettings(),
        );
      }
    }

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.defaultDialog(
          title: 'Locations',
          content: const Text('Location services are disabled.'),
          onConfirm: () async {
            await Geolocator.openLocationSettings();
            Get.back();
          });
    }
  }

  Future<Position> getCurrentPosition() async {
    if (permission != LocationPermission.whileInUse) requsetPermissions();
    return await Geolocator.getCurrentPosition(
        locationSettings: _locationSettings);
  }

  StreamSubscription<Position> getPositionStream(Function(Position)? onData) {
    if (permission != LocationPermission.whileInUse) requsetPermissions();
    return Geolocator.getPositionStream(locationSettings: _locationSettings)
        .listen(onData);
  }


  // test() {
  //   getPositionStream((Position? position) {
  //     print(position == null
  //         ? 'Unknown'
  //         : '${position.latitude.toString()}, ${position.longitude.toString()}');
  //   });
  // }
}
