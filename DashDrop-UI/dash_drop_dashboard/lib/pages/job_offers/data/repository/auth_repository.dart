import 'package:dartz/dartz.dart';
import 'package:dash_drop_dashboard/core/error/exceptions.dart';
import 'package:dash_drop_dashboard/core/error/failure.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';

import '../../domain/entities/job_offer.dart';
import '../../domain/repository/base_job_offers_repository.dart';
import '../data_source/job_offer_remote_data_source.dart';

class JobOffersRepository extends BaseJobOffersRepository {
  JobOffersRepository(this._baseJobOfferRemoteDataSource);

  final BaseJobOfferRemoteDataSource _baseJobOfferRemoteDataSource;

  @override
  ResultFuture<List<JobOffer>> getJobOffers() async {
    final result = await _baseJobOfferRemoteDataSource.getJobOffers();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.message,
          statusCode: failure.errorMessageModel.statusCode));
    } on AuthException catch (failure) {
      return Left(ServerFailure(
          message: failure.authMessage ?? '',
          statusCode: failure.statusCode ?? 401));
    }
  }

  @override
  ResultFuture<JobOffer> createJobOffer(
      {required String description,
      required String requestDeadlineDate,
      required int vehicleDetailId,
      required int regionId}) async {
    final result = await _baseJobOfferRemoteDataSource.createJobOffer(
        description: description,
        requestDeadlineDate: requestDeadlineDate,
        vehicleDetailId: vehicleDetailId,
        regionId: regionId);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.message,
          statusCode: failure.errorMessageModel.statusCode,
          errors: failure.errorMessageModel.errors));
    } on AuthException catch (failure) {
      return Left(ServerFailure(
          message: failure.authMessage ?? '',
          statusCode: failure.statusCode ?? 401));
    }
  }

  @override
  ResultFuture<JobOffer> getJobOffer({required int id}) async {
    final result = await _baseJobOfferRemoteDataSource.getJobOffer(id: id);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.message,
          statusCode: failure.errorMessageModel.statusCode));
    } on AuthException catch (failure) {
      return Left(ServerFailure(
          message: failure.authMessage ?? '',
          statusCode: failure.statusCode ?? 401));
    }
  }

  @override
  ResultVoid deleteJobOffer({required int id}) async {
    final result = _baseJobOfferRemoteDataSource.delelteJobOffer(id: id);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.message,
          statusCode: failure.errorMessageModel.statusCode));
    } on AuthException catch (failure) {
      return Left(ServerFailure(
          message: failure.authMessage ?? '',
          statusCode: failure.statusCode ?? 401));
    }
  }

  @override
  ResultVoid updateJobOffer(
      {required int id,
      required String description,
      required String requestDeadlineDate,
      required int vehicleDetailId,
      required int regionId}) async {
    await _baseJobOfferRemoteDataSource.updateJobOffer(
        id: id,
        description: description,
        requestDeadlineDate: requestDeadlineDate,
        vehicleDetailId: vehicleDetailId,
        regionId: regionId);
    try {
      return const Right(null);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.message,
          statusCode: failure.errorMessageModel.statusCode,
          errors: failure.errorMessageModel.errors));
    } on AuthException catch (failure) {
      return Left(ServerFailure(
          message: failure.authMessage ?? '',
          statusCode: failure.statusCode ?? 401));
    }
  }
}
