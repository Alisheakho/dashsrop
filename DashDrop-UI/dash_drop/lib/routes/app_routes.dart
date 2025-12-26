import 'package:dash_drop/bindings/app_bindings.dart';
import 'package:dash_drop/driver/pages/order/presentation/screens/detielsorder.dart';
import 'package:dash_drop/driver/pages/order/presentation/screens/orders.dart';
import 'package:dash_drop/driver/pages/screens/destination_screen.dart';
import 'package:dash_drop/driver/pages/screens/home_screen.dart';
import 'package:dash_drop/driver/pages/screens/recivings_screen.dart';
import 'package:dash_drop/bindings/bindings.dart';
import 'package:dash_drop/middlewares/welcome_middleware.dart';
import 'package:dash_drop/pages/order/presentation/screens/detielsorder.dart';
import 'package:get/get.dart';
import 'package:dash_drop/pages/bottom_page/bottom_navigation_page.dart';
import 'package:dash_drop/pages/authentication/presentation/screens/change_password_screen/change_password_screen_widget.dart';
import 'package:dash_drop/pages/check_rates_screen/check_rates_screen_widget.dart';
import 'package:dash_drop/pages/detail_location_screen/detail_location_screen_widget.dart';
import 'package:dash_drop/pages/authentication/presentation/screens/edit_profile_screen/edit_profile_screen_widget.dart';
import 'package:dash_drop/pages/faqs_screen/faqs_screen_widget.dart';
import 'package:dash_drop/pages/home_screen/home_page.dart';
import 'package:dash_drop/pages/intro_screen/intro_screen_widget.dart';
import 'package:dash_drop/pages/authentication/presentation/screens/login_screen/login_screen_widget.dart';
import 'package:dash_drop/pages/order/presentation/screens/orders.dart';
import 'package:dash_drop/pages/send_order/presentation/screens/order_detail_screen_widget.dart';
import 'package:dash_drop/pages/profile_screen/profile_page.dart';
import 'package:dash_drop/pages/reset_password_screen/reset_password_screen_widget.dart';
import 'package:dash_drop/driver/pages/scan_barcode_screen/scan_barcode_screen_widget.dart';
import 'package:dash_drop/pages/splash_screen/splash_screen_widget.dart';
class AppRoutes {
  static const String initialRoute = '/initialRoute';
  static const String splashScreenWidget = '/splashScreen_Widget';
  static const String introScreenWidget = '/introScreenWidget';
  static const String callDetailPageWidget = '/callDetailPageWidget';
  static const String changePasswordScreenWidget =
      '/changePasswordScreenWidget';
  static const String checkRatesScreenWidget = '/checkRatesScreenWidget';
  static const String detailLocationScreenWidget =
      '/detailLocationScreenWidget';
  static const String editProfileScreenWidget = '/editProfileScreenWidget';
  static const String faqsScreenWidget = '/faqsScreenWidget';
  static const String forgotPasswordScreenWidget =
      '/forgotPasswordScreenWidget';
  static const String homepageContainerScreen = '/homepageContainerScreen';
  static const String loginScreenWidget = '/loginScreenWidget';
  static const String notificationsScreenWidget = '/notificationsScreenWidget';
  static const String orderDetailScreenWidget = '/orderDetailScreenWidget';
  static const String orderFormScreenWidget = '/orderFormScreenWidget';
  static const String resetPasswordScreenWidget = '/resetPasswordScreenWidget';
  static const String scanBarcodeScreenWidget = '/scanBarcodeScreenWidget';
  static const String signupVerificationScreenWidget =
      '/signupVerificationScreenWidget';
  static const String topUpScreenWidget = '/topUpScreenWidget';
  static const String trackSearchScreenWidget = '/trackSearchScreenWidget';

  static const String homePage = '/homePage';
  static const String myOrderScreen = '/myOrderScreen';
  static const String profilePageWidget = '/profilePageWidget';
   static const String detielsOrder = '/detielsOrder';
static const String myOrderDriverScreen = '/myOrderDriverScreen';

static const String myOrderDetilsDriverScreen = '/myOrderDetilsDriverScreen';

  static const String homepageDrivers = '/homepageDrivers';
  static const String recivingsScreen = '/recivingsScreen';

  static const String destinationScreen = '/destination';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => const SplashScreenWidget(),
      transition: Transition.rightToLeft,
      ),
    GetPage(
      name: detielsOrder,
      page: () =>  MyOrderDetilsScreen(orderList:null),
      transition: Transition.rightToLeft,
      ),
    GetPage(
      name: splashScreenWidget,
      page: () => const SplashScreenWidget(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: introScreenWidget,
      page: () => const IntroScreenWidget(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
        name: loginScreenWidget,
        page: () => const LoginScreenWidget(),
        transition: Transition.rightToLeft,
        middlewares: [WelcomeMiddleware(priority: -1)]),

    GetPage(
      name: changePasswordScreenWidget,
      page: () => const ChangePasswordScreenWidget(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: checkRatesScreenWidget,
      page: () => const CheckRatesScreenWidget(),
      transition: Transition.rightToLeft,
    ),
     GetPage(
      name: myOrderDriverScreen,
      page: () => const MyOrderDriverScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: myOrderDetilsDriverScreen,
      page: () => MyOrderDetilsDriverScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: detailLocationScreenWidget,
      page: () => const DetailLocationScreenWidget(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: editProfileScreenWidget,
      page: () => const EditProfileScreenWidget(),
      transition: Transition.rightToLeft,
    ),
    // driver
    GetPage(
      name: homepageDrivers,
      page: () => const HomepageDriverScreen(),
      transition: Transition.rightToLeft,
      binding: DriverPageBindings(),
    ),
    GetPage(
      name: recivingsScreen,
      page: () => const RecivingsScreen(),
      transition: Transition.rightToLeft,
      
    ),
    GetPage(
      name: destinationScreen,
      page: () => const DestinationScreen(),
      transition: Transition.rightToLeft,
      binding: AppBindings(),
    ),
    // ------
    GetPage(
      name: faqsScreenWidget,
      page: () => const FaqsScreenWidget(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
        name: homepageContainerScreen,
        page: () => const HomepageContainerScreen(),
        transition: Transition.rightToLeft,
        binding: HomePageBindings()),
    GetPage(
      name: orderDetailScreenWidget,
      page: () => const OrderDetailScreenWidget(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: resetPasswordScreenWidget,
      page: () => const ResetPasswordScreenWidget(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: scanBarcodeScreenWidget,
      page: () => const ScanBarcodeScreenWidget(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: homePage,
      page: () => const HomePage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: myOrderScreen,
      page: () => const MyOrderScreen(),
      
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: profilePageWidget,
      page: () => const ProfilePageWidget(),
      transition: Transition.rightToLeft,
    ),
  ];
}
