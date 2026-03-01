import 'dart:convert';

import 'package:dash_drop_dashboard/core/error/exceptions.dart';
import 'package:dash_drop_dashboard/core/network/api_constances.dart';
import 'package:dash_drop_dashboard/core/network/error_message.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/data/model/vehicle_details_model.dart';
import 'package:dio/dio.dart';

abstract class BaseVehicleDataSource {
  Future<VehicleModel> createVehicle(
      {required double costPerKm,
      required int avgSpeedKm,
      required int maxRangekm,
      required double maxCapacityCubicM,
      required int maxWeightKg,
      required SensitivityLevels sensitivityLevel,
      required VehicleTypes type,
      required String specifications});

  Future<List<VehicleModel>> getVehicles();

  Future<VehicleModel> getVehicle({required int id});

  Future<void> updateVehicle(
      {required int id,
      required double costPerKm,
      required int avgSpeedKm,
      required int maxRangekm,
      required double maxCapacityCubicM,
      required int maxWeightKg,
      required SensitivityLevels sensitivityLevel,
      required VehicleTypes type,
      required String specifications});

  Future<void> delelteVehicle({required int id});
}

class VehicleRemoteDataSource extends BaseVehicleDataSource {
  @override
  Future<VehicleModel> createVehicle(
      {required double costPerKm,
      required int avgSpeedKm,
      required int maxRangekm,
      required double maxCapacityCubicM,
      required int maxWeightKg,
      required SensitivityLevels sensitivityLevel,
      required VehicleTypes type,
      required String specifications}) async {
    String token = await ApiConstances.getToken();
    try {
      final response = await Dio().post(ApiConstances.vehicleDetailsUrl,
          options: Options(headers: ApiConstances.headers(token)),
          data: const JsonEncoder().convert({
            "costPerKm": costPerKm,
            "avgSpeedKm": avgSpeedKm,
            "maxRangekm": maxRangekm,
            "maxCapacityCubicM": maxCapacityCubicM,
            "maxWeightKg": maxWeightKg,
            "sensitivityLevel":sensitivityLevel.index,
            "type": type.index,
            "specifications": specifications,
          }));

      return VehicleModel.fromJson(response.data as DataMap);
    } on DioException catch (e) {
      if (401 == e.response?.statusCode || 403 == e.response?.statusCode) {
        throw AuthException(
            statusCode: e.response?.statusCode,
            authMessage: e.response?.statusMessage);
      }
      print(e.response?.data);
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson({
            'message': e.response?.data,
            'statusCode': e.response?.statusCode
          }),
          statusCode: e.response?.statusCode);
    } catch (e) {
      // Handle any other exceptions
      print('Unexpected error: $e');
      throw Exception('Failed to create Vehicle: $e');
    }
  }

  @override
  Future<void> delelteVehicle({required int id}) async {
     String token = await ApiConstances.getToken();
    try {
      await Dio().delete(ApiConstances.vehicleDetailUrl(id),
          options: Options(headers: ApiConstances.headers(token)));
    } on DioException catch (e) {
      if (401 == e.response?.statusCode || 403 == e.response?.statusCode) {
        throw AuthException(
            statusCode: e.response?.statusCode,
            authMessage: e.response?.statusMessage);
      }
      ServerException(
          errorMessageModel: ErrorMessageModel.fromJson({
            'message': e.response?.data,
            'statusCode': e.response?.statusCode
          }),
          statusCode: e.response?.statusCode);
    } catch (e) {
      // Handle any other exceptions
      print('Unexpected error: $e');
      throw Exception('Failed to Delete Vehicle: $e');
    }
  }

  @override
  Future<VehicleModel> getVehicle({required int id}) async {
   try {
      final response = await Dio().get(ApiConstances.vehicleDetailUrl(id));
      return VehicleModel.fromJson(response.data as DataMap);
    } on DioException catch (e) {
      if (401 == e.response?.statusCode || 403 == e.response?.statusCode) {
        throw AuthException(
            statusCode: e.response?.statusCode,
            authMessage: e.response?.statusMessage);
      }
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson({
            'message': e.response?.data,
            'statusCode': e.response?.statusCode
          }),
          statusCode: e.response?.statusCode);
    } catch (e) {
      // Handle any other exceptions
      print('Unexpected error: $e');
      throw Exception('Failed to Get Vehicle: $e');
    }
  }

  @override
  Future<List<VehicleModel>> getVehicles() async {
     try {
      final response = await Dio().get(ApiConstances.vehicleDetailsUrl);
      return List<VehicleModel>.from(
          (response.data as List).map((e) => VehicleModel.fromJson(e)));
    } on DioException catch (e) {
      if (401 == e.response?.statusCode || 403 == e.response?.statusCode) {
        throw AuthException(
            statusCode: e.response?.statusCode,
            authMessage: e.response?.statusMessage);
      }
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson({
            'message': e.response?.data,
            'statusCode': e.response?.statusCode
          }),
          statusCode: e.response?.statusCode);
    } catch (e) {
      // Handle any other exceptions
      print('Unexpected error: $e');
      throw Exception('Failed to Get Vehicles: $e');
    }
  }

  @override
  Future<void> updateVehicle(
      {required int id,
      required double costPerKm,
      required int avgSpeedKm,
      required int maxRangekm,
      required double maxCapacityCubicM,
      required int maxWeightKg,
      required SensitivityLevels sensitivityLevel,
      required VehicleTypes type,
      required String specifications}) async {
    String token = await ApiConstances.getToken();
    try {
      await Dio().put(ApiConstances.vehicleDetailUrl(id),
          options: Options(headers: ApiConstances.headers(token)),
          data: const JsonEncoder().convert({
            "costPerKm": costPerKm,
            "avgSpeedKm": avgSpeedKm,
            "maxRangekm": maxRangekm,
            "maxCapacityCubicM": maxCapacityCubicM,
            "maxWeightKg": maxWeightKg,
            "sensitivityLevel":
               sensitivityLevel.index,
            "type":  type.index,
            "specifications": specifications,
          }));
    } on DioException catch (e) {
      if (401 == e.response?.statusCode || 403 == e.response?.statusCode) {
        throw AuthException(
            statusCode: e.response?.statusCode,
            authMessage: e.response?.statusMessage);
      }
      print(e.response?.data);
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson({
            'message': e.response?.data,
            'statusCode': e.response?.statusCode
          }),
          statusCode: e.response?.statusCode);
    } catch (e) {
      // Handle any other exceptions
      print('Unexpected error: $e');
      throw Exception('Failed to update Vehicle: $e');
    }
  }
}
