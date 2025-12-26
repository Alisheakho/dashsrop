import 'package:dash_drop/pages/authentication/presentation/controller/auth_controller.dart';
import 'package:dash_drop/routes/app_routes.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';

class WelcomeMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  WelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (AuthController.to.isLogin) {
      print(AuthController.to.user.role);
      if (AuthController.to.user.role == 'Customer') {
        return const RouteSettings(name: AppRoutes.homepageContainerScreen);
      } else if (AuthController.to.user.role == 'Driver') {
        return const RouteSettings(name: AppRoutes.homepageDrivers);
      } else {
        return const RouteSettings(name: AppRoutes.homepageContainerScreen);
      }
    } else {
      // print(Get.currentRoute);
      // return const RouteSettings(name: AppRoutes.loginScreenWidget);
      return null;
    }
  }

}
