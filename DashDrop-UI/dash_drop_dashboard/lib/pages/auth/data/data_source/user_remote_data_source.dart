import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dash_drop_dashboard/core/error/exceptions.dart';
import 'package:dash_drop_dashboard/core/network/api_constances.dart';
import 'package:dash_drop_dashboard/core/network/error_message.dart';

import '../model/jwt_model.dart';

abstract class BaseUserRemoteDataSource {
  Future<JwtModel> login({required String email, required String password});

  Future<void> retsetPassword(
      {required String email,
      required String oldPassword,
      required String newPassword});

  Future<JwtModel> refreshToken(
      {required JwtModel jwtModel});
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
          authMessage: e.response.toString(), statusCode: e.response?.statusCode);
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('Failed to login: $e');
    }
  }

  @override
  Future<void> retsetPassword(
      {required String email,
      required String oldPassword,
      required String newPassword}) async {
    String token = await ApiConstances.getToken();
    try {
      await Dio().put(ApiConstances.resetPasswordUrl,
          options: Options(headers: ApiConstances.headers(token)),
          data: const JsonEncoder().convert({
            'email': email,
            'oldPassword': oldPassword,
            'newPassword': newPassword
          }));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw AuthException(
            authMessage: e.response.toString(), statusCode: e.response?.statusCode);
      }
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
          statusCode: e.response?.statusCode);
    } catch (e) {
      print('Unexpected error refresh token : $e');
      throw Exception('Failed to create account: $e');
    }
  }

  @override
  Future<JwtModel> refreshToken(
      {required JwtModel jwtModel}) async {
    try {
      final response = await Dio().post(ApiConstances.refreshUrl,
          options: Options(headers: ApiConstances.headers("")),
          data: const JsonEncoder()
              .convert({'jwtToken': jwtModel.token, 'refreshToken': jwtModel.refreshToken}));
      return JwtModel.fromJson(response.data);
    } on DioException catch (e) {
      print(e.response);
      if (e.response?.statusCode == 401) {
        throw AuthException(
            authMessage: e.response.toString(), statusCode: e.response?.statusCode);
      } else {
        throw Exception('Failed to refresh token: $e');
      }
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('Failed to login: $e');
    }
  }
}
