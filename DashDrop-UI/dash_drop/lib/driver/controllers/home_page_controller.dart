import 'dart:async';
import 'package:dash_drop/core/network/api_constances.dart';
import 'package:dash_drop/core/services/geolocator_services.dart';
import 'package:dash_drop/driver/controllers/driver_location_controller.dart';
import 'package:dash_drop/driver/controllers/recivings_controller.dart';
import 'package:dash_drop/driver/models/reciving.dart';
import 'package:dash_drop/routes/app_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomepageLongDriverController extends GetxController {
  final unfocusNode = FocusNode();

  RxInt selectIndex = 0.obs;

  // get Reciving Delivery Order
  Future<Reciving?> getRDO() async {
    try {
      //print(await ApiConstances.getToken());
      final response = await Dio().get(ApiConstances.activeDeliveryOrder,
          options: Options(
              headers: ApiConstances.headers(await ApiConstances.getToken())));
      print(response.data);
      if (response.data != null) {
        return Reciving.fromJson(response.data);
      }
      return null;
    } on DioException{
      print('rrrr');
      return null;
    }
  }

  Future<void> sendLoction(String loction) async {
    await Dio().put(ApiConstances.sendLoction(loction),
        options: Options(
            headers: ApiConstances.headers(await ApiConstances.getToken())));
  }

  void selectBottomMethod(int value) {
    selectIndex.value = value;
    update();
  }

  @override
  void onInit() async {
    super.onInit();

    if (GeoService.to.permission != LocationPermission.whileInUse) {
      GeoService.to.requsetPermissions();
    }
    Position position = await GeoService.to.getCurrentPosition();
    print("${position.latitude},${position.longitude}");
    await sendLoction("${position.latitude},${position.longitude}");



    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('deliveryOrderId') != null) {
      try{

      if (await getRDO() != null) {
        await HomepageLongRecivingController.to.hubStart();
        Get.toNamed(AppRoutes.destinationScreen, arguments: await getRDO());
      }
      }catch(e){
        print(e.toString());
      }
    }
  }
}
