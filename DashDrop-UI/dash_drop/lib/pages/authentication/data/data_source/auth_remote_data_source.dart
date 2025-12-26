import 'dart:convert';

import 'package:dash_drop/core/error/exceptions.dart';
import 'package:dash_drop/core/network/api_constances.dart';
import 'package:dash_drop/core/network/error_message.dart';
import 'package:dash_drop/core/utils/enums.dart';
import 'package:dio/dio.dart';

import '../model/jwt_model.dart';

abstract class BaseUserRemoteDataSource {
  Future<JwtModel> login({required String email, required String password});

  Future<void> register(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String phoneNumber,
      required Gender gender,
      required String birthdate});

  Future<JwtModel> refreshToken({required JwtModel jwtModel});
}

class UserRemoteDataSource extends BaseUserRemoteDataSource {
  @override
  Future<JwtModel> login(
      {required String email, required String password}) async {
    try {
      final response = await Dio().post(ApiConstances.loginUrl,
          options: Options(headers: ApiConstances.headers("")),
          data: const JsonEncoder()
              .convert({'email': email, 'password': password}));
      // print(response.data);
      return JwtModel.fromJson(response.data);
    } on DioException catch (e) {
      print(e.response);
      throw AuthException(
          authMessage: e.response.toString(),
          statusCode: e.response?.statusCode);
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('Failed to login: $e');
    }
  }

  @override
  Future<void> register(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String phoneNumber,
      required Gender gender,
      required String birthdate}) async {
    try {
      await Dio().post(ApiConstances.registerUrl,
          data: const JsonEncoder().convert({
            'firstName': firstName,
            'lastName': lastName,
            'email': email,
            'password': password,
            'phoneNumber': phoneNumber,
            'gender': gender.index,
            'birthdate': birthdate,
            'regionId': 1,
          }));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw AuthException(
            authMessage: e.response.toString(),
            statusCode: e.response?.statusCode);
      }
      print(e.response?.data);
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
          statusCode: e.response?.statusCode);
    } catch (e) {
      print('Unexpected error refresh token : $e');
      throw Exception('Failed to create account: $e');
    }
  }

  @override
  Future<JwtModel> refreshToken({required JwtModel jwtModel}) async {
    try {
      final response = await Dio().post(ApiConstances.refreshUrl,
          options: Options(headers: ApiConstances.headers("")),
          data: const JsonEncoder().convert({
            'jwtToken': jwtModel.token,
            'refreshToken': jwtModel.refreshToken
          }));
      return JwtModel.fromJson(response.data);
    } on DioException catch (e) {
      print(e.response);
      if (e.response?.statusCode == 401) {
        throw AuthException(
            authMessage: e.response.toString(),
            statusCode: e.response?.statusCode);
      } else {
        throw Exception('Failed to refresh token: $e');
      }
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('Failed to login: $e');
    }
  }
}
