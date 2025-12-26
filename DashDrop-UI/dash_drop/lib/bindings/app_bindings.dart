import 'package:dash_drop/core/services/services_locator.dart';
import 'package:dash_drop/core/services/signalr_services.dart';
import 'package:dash_drop/pages/authentication/presentation/controller/auth_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(sl<AuthController>());
    Get.putAsync<SignalrServices>(() => SignalrServices().init());
  }
}