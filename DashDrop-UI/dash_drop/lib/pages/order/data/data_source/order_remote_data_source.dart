import 'package:dash_drop/core/error/exceptions.dart';
import 'package:dash_drop/core/network/api_constances.dart';
import 'package:dash_drop/pages/order/data/model/oeder_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/error_message.dart';

abstract class BaseOrderRemoteDataSource {
  Future<List<OrderModel>> getOrder();
}

class OrderRemoteDataSource extends BaseOrderRemoteDataSource {
  @override
  Future<List<OrderModel>> getOrder() async {
    try {
      String token = await ApiConstances.getToken();
      final options = Options(
        headers: ApiConstances.headers(token),
      );
      final response =
          await Dio().get(ApiConstances.getOrder, options: options);

      // print(response.data);
      return List<OrderModel>.from(
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
      throw Exception('Failed to get Customers: $e');
    }
  }
}
