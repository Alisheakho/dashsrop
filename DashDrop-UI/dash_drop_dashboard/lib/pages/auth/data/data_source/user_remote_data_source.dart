import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dash_drop_dashboard/core/error/exceptions.dart';
import 'package:dash_drop_dashboard/core/network/api_constances.dart';
import 'package:dash_drop_dashboard/core/network/error_message.dart';
import '../model/jwt_model.dart';

abstract class BaseUserRemoteDataSource {
  Future<JwtModel> login({required String userID, required String password});

  Future<void> retsetPassword(
      {required String userID,
      required String oldPassword,
      required String newPassword});

  Future<JwtModel> refreshToken({required JwtModel jwtModel});
}

class UserRemoteDataSource extends BaseUserRemoteDataSource {
  // We use a Dio instance directly or injected.
  // Ideally, use a single Dio instance for the whole app, but this works for now.
  final Dio _dio = Dio();

  @override
  Future<JwtModel> login(
      {required String userID, required String password}) async {
    try {
      final url = ApiConstances.loginUrl;

      // --- DEBUG PRINT: Request ---
      print("🚀 [Chrome] POST Request to: $url");
      print("📦 [Chrome] Body: $userID");

      final response = await _dio.post(
        url,
        options: Options(
          headers: ApiConstances.headers(""),
          contentType: Headers.jsonContentType, // Ensure correct content type
          validateStatus: (status) => true, // Let us handle errors manually
        ),
        data: jsonEncode({'email': userID, 'password': password}),
      );

      // --- DEBUG PRINT: Response ---
      print("✅ [Chrome] Status Code: ${response.statusCode}");
      print("📥 [Chrome] Response Data: ${response.data}");

      if (response.statusCode == 200) {
        Map<String, dynamic> serverData = response.data['data'];
        if (serverData['refreshToken'] == null) {
          serverData['refreshToken'] = "";
        }

        return JwtModel.fromJson(serverData);
      } else {
        // Handle server errors (like 401 Unauthorized)
        throw AuthException(
          authMessage: response.data['message'] ??
              response.statusMessage ??
              "Unknown Error",
          statusCode: response.statusCode ?? 400,
        );
      }
    } on DioException catch (e) {
      // Handle network crashing errors
      print("❌ [Chrome] Dio Error: ${e.message}");
      throw AuthException(
          authMessage: "Connection Failed: ${e.message}", statusCode: 500);
    } catch (e) {
      print("❌ [Chrome] Unexpected Error: $e");
      throw Exception('Failed to login: $e');
    }
  }

  @override
  Future<void> retsetPassword(
      {required String userID,
      required String oldPassword,
      required String newPassword}) async {
    try {
      String token = await ApiConstances.getToken();

      print("🚀 [Chrome] Reset Password Request");

      final response = await _dio.put(
        ApiConstances.resetPasswordUrl,
        options: Options(headers: ApiConstances.headers(token)),
        data: jsonEncode({
          'email': userID,
          'oldPassword': oldPassword,
          'newPassword': newPassword
        }),
      );

      print("✅ [Chrome] Reset Status: ${response.statusCode}");

      if (response.statusCode != 200) {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
          statusCode: response.statusCode ?? 400,
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw AuthException(
            authMessage: e.response.toString(),
            statusCode: e.response?.statusCode);
      }
      rethrow;
    } catch (e) {
      print('Unexpected error refresh token : $e');
      throw Exception('Failed to reset password: $e');
    }
  }

  @override
  Future<JwtModel> refreshToken({required JwtModel jwtModel}) async {
    try {
      final response = await _dio.post(
        ApiConstances.refreshUrl,
        options: Options(headers: ApiConstances.headers("")),
        data: jsonEncode({
          'jwtToken': jwtModel.token,
          'refreshToken': jwtModel.refreshToken
        }),
      );
      return JwtModel.fromJson(response.data);
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('Failed to refresh token: $e');
    }
  }
}
