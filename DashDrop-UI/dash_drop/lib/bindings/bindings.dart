
import 'package:dash_drop/core/services/services_locator.dart';
import 'package:dash_drop/driver/pages/order/presentation/controller/reder_controller.dart';
import 'package:dash_drop/pages/bottom_page/bottom_page_controller.dart';
import 'package:dash_drop/pages/order/presentation/controller/reder_controller.dart';
import 'package:dash_drop/pages/receive_order/presentation/controller/receive_order_controller.dart';
import 'package:dash_drop/pages/home_screen/home_controller.dart';
import 'package:get/get.dart';

import '../pages/send_order/presentation/controller/send_order_controller.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ReceiveOrderController>(sl<ReceiveOrderController>());
    Get.put<SendOrderController>(sl<SendOrderController>());
    Get.put(HomePageController());
    Get.put(HomepageLongContainerController());
    Get.put<OrderController>(sl<OrderController>());
  }
}

class DriverPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<OrderDriverController>(sl<OrderDriverController>());
  }
}
