import 'package:dash_drop/core/error/exceptions.dart';
import 'package:dash_drop/core/network/api_constances.dart';
import 'package:dash_drop/pages/driver_orders/data/model/oeder_model.dart';
import 'package:dash_drop/pages/order/data/model/oeder_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/error_message.dart';

abstract class BaseDriverOrderRemoteDataSource {
  Future<List<DriverOrderModel>> getOrder();
}

class DriverOrderRemoteDataSource extends BaseDriverOrderRemoteDataSource {
  @override
  Future<List<DriverOrderModel>> getOrder() async {
    try {
      String token = await ApiConstances.getToken();
      final options = Options(
        headers: ApiConstances.headers(token),
      );
      final response =
          await Dio().get(ApiConstances.driversOrders, options: options);

      print(response.data);
      return List<DriverOrderModel>.from(
          (response.data as List).map((e) => OrderModel.fromJson(e)));
    } on DioException catch (e) {
      if (401 == e.response?.statusCode || 403 == e.response?.statusCode) {
        throw AuthException(
            statusCode: e.response?.statusCode,
            authMessage: e.response?.statusMessage);
      }
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
          statusCode: e.response?.statusCode);
    } catch (e) {
      // Handle any other exceptions
      print('Unexpected error: $e');
      throw Exception('Failed to get Driver: $e');
    }
  }
}
