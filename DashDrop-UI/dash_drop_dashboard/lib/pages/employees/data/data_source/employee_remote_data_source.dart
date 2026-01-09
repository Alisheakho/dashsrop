import 'dart:convert';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dio/dio.dart';
import 'package:dash_drop_dashboard/core/error/exceptions.dart';
import 'package:dash_drop_dashboard/core/network/api_constances.dart';
import '../../../../core/network/error_message.dart';
import '../model/employee_model.dart';

abstract class BaseEmployeeRemoteDataSource {
  Future<EmployeeModel> createEmployee(
      {required String firstName,
      required String lastName,
      required String userID,
      required String password,
      required String phoneNumber,
      required String title,
      required Gender gender,
      required String birthdate});

  Future<List<EmployeeModel>> getEmployees();

  Future<EmployeeModel> getEmployee({required int id});

  Future<void> updateEmployee(
      {required int id,
      required String firstName,
      required String lastName,
      required String userID,
      required String password,
      required String phoneNumber,
      required String title,
      required Gender gender,
      required String birthdate});

  void delelteEmployee({required int id});
}

class EmployeeRemoteDataSource extends BaseEmployeeRemoteDataSource {
  @override
  Future<List<EmployeeModel>> getEmployees() async {
    try {
      final response = await Dio().get(ApiConstances.employeesUrl);
      return List<EmployeeModel>.from(
          (response.data as List).map((e) => EmployeeModel.fromJson(e)));
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
      throw Exception('Failed to get employees: $e');
    }
  }

  @override
  Future<EmployeeModel> getEmployee({required int id}) async {
    try {
      final response = await Dio().get(ApiConstances.employeeUrl(id));
      return EmployeeModel.fromJson(response.data as DataMap);
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
      throw Exception('Failed to get employee: $e');
    }
  }

  @override
  Future<EmployeeModel> createEmployee(
      {required String firstName,
      required String lastName,
      required String userID,
      required String password,
      required String phoneNumber,
      required String title,
      required Gender gender,
      required String birthdate}) async {
    String token = await ApiConstances.getToken();
    try {
      final response = await Dio().post(ApiConstances.employeesUrl,
          options: Options(headers: ApiConstances.headers(token)),
          data: const JsonEncoder().convert({
            'firstName': firstName,
            'lastName': lastName,
            'userID': userID,
            'password': password,
            'phoneNumber': phoneNumber,
            'title': title,
            'gender': gender == Gender.male ? 0 : 1,
            'birthdate': birthdate,
          }));
      return EmployeeModel.fromJson(response.data as DataMap);
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
      throw Exception('Failed to create employee: $e');
    }
  }

  @override
  Future<void> updateEmployee(
      {required int id,
      required String firstName,
      required String lastName,
      required String userID,
      required String password,
      required String phoneNumber,
      required String title,
      required Gender gender,
      required String birthdate}) async {
    String token = await ApiConstances.getToken();
    try {
      await Dio().put(ApiConstances.employeeUrl(id),
          options: Options(headers: ApiConstances.headers(token)),
          data: const JsonEncoder().convert({
            'firstName': firstName,
            'lastName': lastName,
            'userID': userID,
            'password': password == "" ? null : password,
            'phoneNumber': phoneNumber,
            'title': title,
            'gender': gender == Gender.male ? 0 : 1,
            'birthdate': birthdate,
          }));
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
      throw Exception('Failed to update employee: $e');
    }
  }

  @override
  void delelteEmployee({required int id}) async {
    String token = await ApiConstances.getToken();
    try {
      await Dio().delete(ApiConstances.employeeUrl(id),
          options: Options(headers: ApiConstances.headers(token)));
    } on DioException catch (e) {
      if (401 == e.response?.statusCode || 403 == e.response?.statusCode) {
        throw AuthException(
            statusCode: e.response?.statusCode,
            authMessage: e.response?.statusMessage);
      }
      ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
          statusCode: e.response?.statusCode);
    } catch (e) {
      // Handle any other exceptions
      print('Unexpected error: $e');
      throw Exception('Failed to Delete employee: $e');
    }
  }
}
