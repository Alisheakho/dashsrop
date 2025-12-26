import 'dart:convert';

import 'package:dash_drop/core/error/exceptions.dart';
import 'package:dash_drop/core/network/api_constances.dart';
import 'package:dash_drop/core/network/error_message.dart';
import 'package:dash_drop/custom_widgets/lat_lng.dart';
import 'package:dash_drop/pages/receive_order/data/model/send_location_model.dart';
import 'package:dio/dio.dart';

import '../model/cost_info_model.dart';
import '../model/polyline_info_model.dart';

abstract class BaseReceiveOrderRemoteDataSource {
  Future<SenderLocationModel> receiveSenderLocation(
      {required String receivingCode});

  Future<PolylineInfoModel> getPolyline(
      {required LatLng1 origin, required LatLng1 destination});

  Future<CostInfoModel> calcCost(
      {required String receivingCode, required double pathLengthKm});

  Future<void> confirmOrder(
      {required String destinationLocation,
      required String destinationAddress,
      required String receivingCode,
      required String polyline,
      required double pathLengthKm});
}

class ReceiveOrderRemoteDataSource extends BaseReceiveOrderRemoteDataSource {
  @override
  Future<SenderLocationModel> receiveSenderLocation(
      {required String receivingCode}) async {
    String token = await ApiConstances.getToken();
    try {
      final response = await Dio().get(
          ApiConstances.receiveOrderUrl(receivingCode),
          options: Options(headers: ApiConstances.headers(token)));
      // print(response.data);
      return SenderLocationModel.fromJson(response.data);
    } on DioException catch (e) {
      if (401 == e.response?.statusCode || 403 == e.response?.statusCode) {
        throw AuthException(
            authMessage: e.response.toString(),
            statusCode: e.response?.statusCode);
      }
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
          statusCode: e.response?.statusCode);
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('Failed to login: $e');
    }
  }

  @override
  Future<PolylineInfoModel> getPolyline(
      {required LatLng1 origin, required LatLng1 destination}) async {
    try {
      final response = await Dio().get(
          ApiConstances.polylineUrl(
              origin.serialize(), destination.serialize()),
          options: Options(headers: ApiConstances.headers('')));
      // print(response.data);
      return PolylineInfoModel.fromJson(response.data);
    } on DioException catch (e) {
      print(e);
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(
              {'title': e.message, 'status': e.response?.statusCode}),
          statusCode: e.response?.statusCode);
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('Failed to get polyline: $e');
    }
  }

  @override
  Future<CostInfoModel> calcCost(
      {required String receivingCode, required double pathLengthKm}) async {
    String token = await ApiConstances.getToken();
    try {
      final response = await Dio().get(
          ApiConstances.costCalc(receivingCode, pathLengthKm),
          options: Options(headers: ApiConstances.headers(token)));
      // print(response.data);
      return CostInfoModel.fromJson(response.data);
    } on DioException catch (e) {
      if (401 == e.response?.statusCode || 403 == e.response?.statusCode) {
        throw AuthException(
            authMessage: e.response.toString(),
            statusCode: e.response?.statusCode);
      }
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
          statusCode: e.response?.statusCode);
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('Failed to login: $e');
    }
  }

  @override
  Future<void> confirmOrder(
      {required String destinationLocation,
      required String destinationAddress,
      required String receivingCode,
      required String polyline,
      required double pathLengthKm}) async {
    String token = await ApiConstances.getToken();
    try {
      await Dio().put(ApiConstances.receiveOrder,
          options: Options(headers: ApiConstances.headers(token)),
          data: jsonEncode({
            "destinationLocation": destinationLocation,
            "destinationLocationDescription": destinationAddress,
            "receivingCode": receivingCode,
            "polyline": polyline,
            "pathLengthKm": pathLengthKm
          }));
    } on DioException catch (e) {
      if (401 == e.response?.statusCode || 403 == e.response?.statusCode) {
        throw AuthException(
            authMessage: e.response.toString(),
            statusCode: e.response?.statusCode);
      }
      print(e.response?.data["error"]);
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(
              {'title': e.response!.data["error"], 'status': e.response?.statusCode}),
          statusCode: e.response?.statusCode);
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('Failed to login: $e');
    }
  }
}
