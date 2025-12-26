import 'package:shared_preferences/shared_preferences.dart';

import '../../pages/auth/data/model/jwt_model.dart';

class ApiConstances {
  static const String _baseUrl = "http://13.232.169.108/api";

  static Map<String, dynamic> headers(String token) {
    if (token == '') {
      return {"accept": "application/json"};
    } else {
      return {"accept": "application/json", "Authorization": "Bearer $token"};
    }
  }

  static Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jwt = prefs.getString('jwt');
    if (jwt != null) {
      return JwtModel.fromStr(jwt).token;
    }
    return "";
  }

  // Authentication
  static const String loginUrl = "$_baseUrl/Accounts/login";
  static const String refreshUrl = "$_baseUrl/Accounts/Refresh";
  static const String resetPasswordUrl = "$_baseUrl/Accounts/reset-password";

  // Employees
  static const String employeesUrl = "$_baseUrl/Employees";
  static String employeeUrl(int id) => "$employeesUrl/$id";

  // Customers
  static const String customersUrl = "$_baseUrl/Customers";
  static String customerUrl(int id) => "$customersUrl/$id";

  // Job Offers
  static const String jobOffersUrl = "$_baseUrl/JobOffers";
  static String jobOfferUrl(int id) => "$jobOffersUrl/$id";

  // Drivers
  static const String driversUrl = "$_baseUrl/Drivers";
  static String driverUrl(int id) => "$driversUrl/$id";

  // VehicleDetails
  static const String vehicleDetailsUrl = "$_baseUrl/VehicleDetails";
  static String vehicleDetailUrl(int id) => "$vehicleDetailsUrl/$id";

  // Regions
  static const String regionsUrl = "$_baseUrl/Regions";
  static String regionUrl(int id) => "$regionsUrl/$id";

  // HieringRequests
  static const String hieringsUrl = "$_baseUrl/HieringRequests";
  static String hieringUrl(int id) => "$hieringsUrl/$id";
}
