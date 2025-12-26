import 'dart:convert';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/data/model/hiering_model.dart';
import 'package:dio/dio.dart';
import 'package:dash_drop_dashboard/core/error/exceptions.dart';
import 'package:dash_drop_dashboard/core/network/api_constances.dart';
import '../../../../../core/network/error_message.dart';

abstract class BaseHieringRemoteDataSource {
  Future<HieringModel> createHiering({required String firstName,
      required String lastName,
      required String email,
      required String phoneNumber,
      required String vehiclePlateNumber,
      required String idNumber,
      required int jobOfferId,
      required Gender gender,
      required String birthdate});

  Future<List<HieringModel>> getHierings();

  Future<HieringModel> getHiering({required int id});

  Future<void> updateHiering({required int id,
      required String firstName,
      required String lastName,
      required String email,
      required String phoneNumber,
      required String vehiclePlateNumber,
      required String idNumber,
      required int jobOfferId,
      required Gender gender,
      required String birthdate});

  Future<void> delelteHiering({required int id});


}

class HieringRemoteDataSource extends BaseHieringRemoteDataSource {
  @override
  Future<List<HieringModel>> getHierings() async {
    try {
      final response = await Dio().get(ApiConstances.hieringsUrl);
      //print(response.data);
      return List<HieringModel>.from(
          (response.data as List).map((e) => HieringModel.fromJson(e)));

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
      throw Exception('Failed to get Hierings: $e');
    }
  }

  @override
  Future<HieringModel> getHiering({required int id}) async {
    try {
      final response = await Dio().get(ApiConstances.hieringUrl(id));
      final respon =response.data; 


      return HieringModel.fromJson(respon as DataMap);
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
      throw Exception('Failed to get Hiering: $e');
    }
  }

  @override
  Future<HieringModel> createHiering({
      required String firstName,
      required String lastName,
      required String email,
      required String phoneNumber,
      required String vehiclePlateNumber,
      required String idNumber,
      required int jobOfferId,
      required Gender gender,
      required String birthdate}) async {
    String token = await ApiConstances.getToken();
    try {
      final response = await Dio().post(ApiConstances.hieringsUrl,
          options: Options(headers: ApiConstances.headers(token)),
          data: const JsonEncoder().convert({
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "phoneNumber": phoneNumber,
            "vehiclePlateNumber": vehiclePlateNumber,
            "idNumber": idNumber,
            "gender": gender.index,
            "birthdate": birthdate,
            "jobOfferId":jobOfferId
          }));
      return HieringModel.fromJson(response.data as DataMap);
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
      throw Exception('Failed to create Hiering: $e');
    }
  }

  @override
  Future<void> updateHiering({required int id,
      required String firstName,
      required String lastName,
      required String email,
      required String phoneNumber,
      required String vehiclePlateNumber,
      required String idNumber,
      required int jobOfferId,
      required Gender gender,
      required String birthdate}) async {
    try {
      String token = await ApiConstances.getToken();
      await Dio().put(ApiConstances.hieringUrl(id),
          options: Options(headers: ApiConstances.headers(token)),
          data: const JsonEncoder().convert({
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "phoneNumber": phoneNumber,
            "vehiclePlateNumber": vehiclePlateNumber,
            "idNumber": idNumber,
            "gender": gender.index,
            "birthdate": birthdate,
            "jobOfferId": jobOfferId,
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
      throw Exception('Failed to update Hiering: $e');
    }
  }

  @override
  Future<void> delelteHiering({required int id}) async {
    String token = await ApiConstances.getToken();
    try {
      await Dio().delete(ApiConstances.hieringUrl(id),
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
      throw Exception('Failed to Delete Hiering: $e');
    }
  }

 
}
