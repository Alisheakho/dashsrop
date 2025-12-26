import 'dart:convert';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/drivers/data/model/driver_model.dart';
import 'package:dash_drop_dashboard/pages/drivers/data/model/regions_model.dart';
import 'package:dash_drop_dashboard/pages/drivers/data/model/vehicle_details_model.dart';
import 'package:dio/dio.dart';
import 'package:dash_drop_dashboard/core/error/exceptions.dart';
import 'package:dash_drop_dashboard/core/network/api_constances.dart';
import '../../../../../core/network/error_message.dart';

abstract class BaseDriverRemoteDataSource {
  Future<DriverModel> createDriver({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required int gender,
    required String birthdate,
    required String vehiclePlateNumber,
    required String password,
    required String idNumber,
    required int regionId,
    required int vehicleDetailId,
  });

  Future<List<DriverModel>> getDrivers();

  Future<DriverModel> getDriver({required int id});

  Future<void> updateDriver({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required int gender,
    required String birthdate,
    required String vehiclePlateNumber,
    required String password,
    required String idNumber,
    required int regionId,
    required int vehicleDetailId,
  });

  Future<void> delelteDriver({required int id});

  Future<List<RegionsModel>> getRegions();

  Future<List<VehicleDetailsModel>> getVehicleDetails();
}

class DriverRemoteDataSource extends BaseDriverRemoteDataSource {
  @override
  Future<List<DriverModel>> getDrivers() async {
    try {
      final response = await Dio().get(ApiConstances.driversUrl);
      return List<DriverModel>.from(
          (response.data as List).map((e) => DriverModel.fromJson(e)));
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
      throw Exception('Failed to get Drivers: $e');
    }
  }

  @override
  Future<DriverModel> getDriver({required int id}) async {
    try {
      final response = await Dio().get(ApiConstances.driverUrl(id));
      return DriverModel.fromJson(response.data as DataMap);
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
      throw Exception('Failed to get Driver: $e');
    }
  }

  @override
  Future<DriverModel> createDriver({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required int gender,
    required String birthdate,
    required String vehiclePlateNumber,
    required String password,
    required String idNumber,
    required int regionId,
    required int vehicleDetailId,
  }) async {
    String token = await ApiConstances.getToken();
    try {
      final response = await Dio().post(ApiConstances.driversUrl,
          options: Options(headers: ApiConstances.headers(token)),
          data: const JsonEncoder().convert({
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "password": password,
            "phoneNumber": phoneNumber,
            "gender": gender,
            "birthdate": birthdate,
            "vehiclePlateNumber": vehiclePlateNumber,
            "idNumber": idNumber,
            "regionId": regionId,
            "vehicleDetailId": vehicleDetailId
          }));
      return DriverModel.fromJson(response.data as DataMap);
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
      throw Exception('Failed to create Driver: $e');
    }
  }

  @override
  Future<void> updateDriver({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required int gender,
    required String birthdate,
    required String vehiclePlateNumber,
    required String password,
    required String idNumber,
    required int regionId,
    required int vehicleDetailId,
  }) async {
    try {
      String token = await ApiConstances.getToken();
      await Dio().put(ApiConstances.driverUrl(id),
          options: Options(headers: ApiConstances.headers(token)),
          data: const JsonEncoder().convert({
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            //"password": password,
            "phoneNumber": phoneNumber,
            "gender": gender,
            "birthdate": birthdate,
            "vehiclePlateNumber": vehiclePlateNumber,
            "idNumber": idNumber,
            "regionId": regionId,
            "vehicleDetailId": vehicleDetailId
          }));
    } on DioException catch (e) {
      if (401 == e.response?.statusCode || 403 == e.response?.statusCode) {
        throw AuthException(
            statusCode: e.response?.statusCode,
            authMessage: e.response?.statusMessage);
      }
      print(e.response?.data);
       print(regionId);
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson({
            'message': e.response?.data,
            'statusCode': e.response?.statusCode
          }),
          statusCode: e.response?.statusCode);
    } catch (e) {
      // Handle any other exceptions
      print('Unexpected error: $e');
      throw Exception('Failed to update Driver: $e');
    }
  }

  @override
  Future<void> delelteDriver({required int id}) async {
    String token = await ApiConstances.getToken();
    try {
      await Dio().delete(ApiConstances.driverUrl(id),
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
      throw Exception('Failed to Delete Driver: $e');
    }
  }

  @override
  Future<List<RegionsModel>> getRegions() async {
    try {
      final response = await Dio().get(ApiConstances.regionsUrl);
      return List<RegionsModel>.from(
          (response.data as List).map((e) => RegionsModel.fromJson(e)));
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
      throw Exception('Failed to get Regions: $e');
    }
  }

  @override
  Future<List<VehicleDetailsModel>> getVehicleDetails() async {
    try {
      final response = await Dio().get(ApiConstances.vehicleDetailsUrl);
      //print(response.data);
      return List<VehicleDetailsModel>.from(
          (response.data as List).map((e) => VehicleDetailsModel.fromJson(e)));
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
      throw Exception('Failed to get Vehicle Details: $e');
    }
  }
}
