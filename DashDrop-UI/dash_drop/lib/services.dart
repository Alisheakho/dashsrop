import 'package:dash_drop/app_state.dart';
import 'package:dash_drop/core/services/geolocator_services.dart';
import 'package:dash_drop/core/services/services_locator.dart';
import 'package:dash_drop/core/services/signalr_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:get/get.dart';

class Global {
  init() async {
    WidgetsFlutterBinding.ensureInitialized();
    usePathUrlStrategy();
    ServicesLocator().init();
    final appState = AppState(); // Initialize AppState
    await appState.initializePersistedState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]).then((value) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark));
    });
    print('starting services ...');
    await Get.putAsync<GeoService>(() => GeoService().init());
    print('All services started...');
  }
}
