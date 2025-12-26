import 'dart:convert';

import 'package:dash_drop/core/error/exceptions.dart';
import 'package:dash_drop/core/network/api_constances.dart';
import 'package:dash_drop/core/network/error_message.dart';
import 'package:dash_drop/pages/send_order/data/model/create_order_model.dart';
import 'package:dio/dio.dart';

abstract class BaseSendOrderRemoteDataSource {
  Future<String> makeOrder({required CreateOrderModel createOrder});
}

class SendOrderRemoteDataSource extends BaseSendOrderRemoteDataSource {
  @override
  Future<String> makeOrder({required CreateOrderModel createOrder}) async {
    String token = await ApiConstances.getToken();
    try {
      final response = await Dio().post(ApiConstances.deliveryOrdersUrl,
          options: Options(headers: ApiConstances.headers(token)),
          data: json.encode(createOrder.toMap()));
      if (response.data.isNotEmpty) {
        Map receivingCode = response.data;
        return receivingCode["receivingCode"] ?? '';
      } else {
        return '';
      }
    } on DioException catch (e) {
      if (401 == e.response?.statusCode || 403 == e.response?.statusCode) {
        throw AuthException(
            authMessage: e.response.toString(),
            statusCode: e.response?.statusCode);
      }
      print(e.response?.data);
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
          statusCode: e.response?.statusCode);
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('Failed to login: $e');
    }
  }
}
