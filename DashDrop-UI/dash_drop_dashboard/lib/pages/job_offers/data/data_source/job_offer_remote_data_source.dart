import 'dart:convert';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dio/dio.dart';
import 'package:dash_drop_dashboard/core/error/exceptions.dart';
import 'package:dash_drop_dashboard/core/network/api_constances.dart';
import '../../../../core/network/error_message.dart';
import '../model/job_offer_model.dart';

abstract class BaseJobOfferRemoteDataSource {
  Future<JobOfferModel> createJobOffer(
      {required String description,
      required String requestDeadlineDate,
      required int vehicleDetailId,
      required int regionId});

  Future<List<JobOfferModel>> getJobOffers();

  Future<JobOfferModel> getJobOffer({required int id});

  Future<void> updateJobOffer(
      {required int id,
      required String description,
      required String requestDeadlineDate,
      required int vehicleDetailId,
      required int regionId});

  void delelteJobOffer({required int id});
}

class JobOfferRemoteDataSource extends BaseJobOfferRemoteDataSource {
  @override
  Future<List<JobOfferModel>> getJobOffers() async {
    try {
      final response = await Dio().get(ApiConstances.jobOffersUrl);
      print(response);
      return List<JobOfferModel>.from(
          (response.data as List).map((e) => JobOfferModel.fromJson(e)));
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
      print('Unexpected gjs error: $e');
      throw Exception('Failed to get JobOffers: $e ');
    }
  }

  @override
  Future<JobOfferModel> getJobOffer({required int id}) async {
    try {
      final response = await Dio().get(ApiConstances.jobOfferUrl(id));
      return JobOfferModel.fromJson(response.data as DataMap);
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
      print('Unexpected gj error: $e');
      throw Exception('Failed to get JobOffer: $e');
    }
  }

  @override
  Future<JobOfferModel> createJobOffer(
      {required String description,
      required String requestDeadlineDate,
      required int vehicleDetailId,
      required int regionId}) async {
    String token = await ApiConstances.getToken();
    try {
      final response = await Dio().post(ApiConstances.jobOffersUrl,
          options: Options(headers: ApiConstances.headers(token)),
          data: const JsonEncoder().convert({
            'description': description,
            'requestDeadlineDate': requestDeadlineDate,
            'vehicleDetailId': vehicleDetailId,
            'regionId': regionId
          }));
      return JobOfferModel.fromJson(response.data as DataMap);
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
      print('Unexpected cj error: $e');
      throw Exception('Failed to create JobOffer: $e');
    }
  }

  @override
  Future<void> updateJobOffer(
      {required int id,
      required String description,
      required String requestDeadlineDate,
      required int vehicleDetailId,
      required int regionId}) async {
    String token = await ApiConstances.getToken();
    try {
      await Dio().put(ApiConstances.jobOfferUrl(id),
          options: Options(headers: ApiConstances.headers(token)),
          data: const JsonEncoder().convert({
            'description': description,
            'requestDeadlineDate': requestDeadlineDate,
            'vehicleDetailId': vehicleDetailId,
            'regionId': regionId
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
      print('Unexpected uj error: $e');
      throw Exception('Failed to update JobOffer: $e');
    }
  }

  @override
  void delelteJobOffer({required int id}) async {
    String token = await ApiConstances.getToken();
    try {
      await Dio().delete(ApiConstances.jobOfferUrl(id),
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
      print('Unexpected dj error: $e');
      throw Exception('Failed to Delete JobOffer: $e');
    }
  }
}
