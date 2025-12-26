import 'package:dash_drop/core/services/signalr_services.dart';
import 'package:dash_drop/core/utils/enums.dart';
import 'package:dash_drop/custom_widgets/loading_dialog.dart';
import 'package:dash_drop/pages/authentication/domain/usecase/get_user.dart';
import 'package:dash_drop/pages/authentication/domain/usecase/is_authorized.dart';
import 'package:dash_drop/pages/authentication/domain/usecase/register.dart';
import 'package:dash_drop/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecase/login.dart';
import '../../domain/usecase/logout.dart';
import '../screens/login_screen/login_screen_model.dart';

class AuthController extends GetxController {
  final Rx<User> _user = const User(
    id: -1,
    name: '',
    role: '',
    emailaddress: '',
    regionid: 0,
    dateofbirth: '',
  ).obs;
  final RxBool isAuthorized = false.obs;
  final RxString getUserErrorMessage = ''.obs;

  final GetUserUseCase getUserUseCase;
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;
  final IsAuthorizedUseCase isAuthorizedUseCase;

  AuthController(
    this.getUserUseCase,
    this.loginUseCase,
    this.registerUseCase,
    this.logoutUseCase,
    this.isAuthorizedUseCase,
  );

  static AuthController get to => Get.find<AuthController>();
  bool get isLogin => isAuthorized.value;
  User get user => _user.value;

  Future<void> getUser() async {
    if (isAuthorized.value) {
      final result = await getUserUseCase(const NoParameters());
      result.fold(
        (error) => getUserErrorMessage.value = error.message,
        (userData) => _user.value = userData,
      );
    }
  }

  Future<void> login(String email, String password) async {
    Get.dialog(const LoadingDialogWidget());
    final result =
        await loginUseCase(LoginParameters(email: email, password: password));
    result.fold(
      (error) {
        if (Get.isDialogOpen == true) Get.back();
        Get.snackbar('Error', error.message,
            colorText: const Color(0xFFF57625));
      },
      (_) {
        isAuthorized.value = true;
        getUser();
        if (Get.isDialogOpen == true) Get.back();
        if (user.role == 'Customer') {
          Get.offNamed(AppRoutes.homepageContainerScreen);
        } else if (user.role == 'Driver') {
          Get.offNamed(AppRoutes.homepageDrivers);
        }
        Get.snackbar('Success', 'Wlocome');
      },
    );
  }

  Future<void> register(
      String firstName,
      String lastName,
      String email,
      String password,
      String phoneNumber,
      Gender gender,
      String birthdate) async {
    Get.dialog(const LoadingDialogWidget());
    final result = await registerUseCase(RegisterParameters(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        gender: gender,
        birthdate: birthdate));
    result.fold(
      (error) {
        if (Get.isDialogOpen == true) Get.back();
        Get.snackbar('Error', error.message);
      },
      (_) {
        if (Get.isDialogOpen == true) Get.back();
        Get.snackbar('Success', 'Creating account success please log in');
        LoginScreenController widgetConttroller =
            Get.find<LoginScreenController>();
        widgetConttroller.tabBarController?.index = 1;
      },
    );
  }

  Future<void> logout() async {
    final result = await logoutUseCase(const NoParameters());
    result.fold(
      (error) => Get.snackbar('Error', error.message),
      (_) {
        isAuthorized.value = false;
        Get.offAllNamed(AppRoutes.loginScreenWidget);
      },
    );
  }

  Future<void> checkAuth() async {
    final result = await isAuthorizedUseCase(const NoParameters());
    result.fold(
      (error) => isAuthorized.value = false,
      (value) => isAuthorized.value = value,
    );

    getUser();
  }

  @override
  void onInit() {
    super.onInit();
    checkAuth();
  }
}
