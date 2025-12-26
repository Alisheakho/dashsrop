import 'package:shared_preferences/shared_preferences.dart';

import '../../pages/authentication/data/model/jwt_model.dart';

class ApiConstances {
  static const String _baseUrl = "http://13.232.169.108/api";
  static const String _baseGoogleApiDirectionsUrl =
      "https://maps.googleapis.com/maps/api/directions/json";

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

  static String polylineUrl(String origin, String destination) =>
      "$_baseGoogleApiDirectionsUrl?origin=$origin&destination=$destination&mode=driving&avoidHighways=false&avoidFerries=false&avoidTolls=false&alternatives=false&key=AIzaSyDSUBRaBXaS_Bg1G-oliJttVVhja6JIZ8Q";

  // Authentication
  static const String loginUrl = "$_baseUrl/Accounts/login";
  static const String refreshUrl = "$_baseUrl/Accounts/Refresh";
  static const String registerUrl = "$_baseUrl/Accounts/register";


  //Customers  Order
  static const String getOrder = "$_baseUrl/Customers/DeliveryOrders";

  //driver
  static String sginlRUrl(String token) => "http://13.232.169.108/api/hubs/DeliveryOrders?jwt_token=$token";
  static const String activeDeliveryOrder = "$_baseUrl/Drivers/ActiveDeliveryOrder";

  // Dilivary Order
  static const deliveryOrdersUrl = "$_baseUrl/DeliveryOrders";
  static String receiveOrderUrl(String receivingCode) =>
      "$_baseUrl/DeliveryOrders/Receive/$receivingCode";
  static const receiveOrder = "$_baseUrl/DeliveryOrders/Receive";
  static String sendLoction(String loction) => "$_baseUrl/Drivers/SetLocation/$loction";
  static String costCalc(String receivingCode, double pathLengthKm) =>
      "$_baseUrl/DeliveryOrders/Receive/$receivingCode/$pathLengthKm";
  //driver orders
  static const driversOrders = "$_baseUrl/Drivers/DeliveryOrders";

}