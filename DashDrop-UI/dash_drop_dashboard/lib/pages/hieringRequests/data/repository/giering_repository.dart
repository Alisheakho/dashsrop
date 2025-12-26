import 'package:dartz/dartz.dart';
import 'package:dash_drop_dashboard/core/error/exceptions.dart';
import 'package:dash_drop_dashboard/core/error/failure.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/data/data_source/hiering_remote_data_source.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/domain/entities/hiering.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/domain/repository/base_hiering_repository.dart';

class HieringRepository extends BaseHieringsRepository {
  HieringRepository({required this.baseHieringRemoteDataSource});

  final BaseHieringRemoteDataSource baseHieringRemoteDataSource;

  @override
  ResultFuture<Hiering> createHierings(
      {required String firstName,
      required String lastName,
      required String email,
      required String phoneNumber,
      required String vehiclePlateNumber,
      required String idNumber,
      required bool isAccepted,
      //required Employee employee,
      required int jobOfferId,
      required Gender gender,
      required String birthdate}) async {
    try {
      final result = await baseHieringRemoteDataSource.createHiering(
          firstName: firstName,
          lastName: lastName,
          email: email,
          phoneNumber: phoneNumber,
          vehiclePlateNumber: vehiclePlateNumber,
          idNumber: idNumber,
          jobOfferId: jobOfferId,
          gender: gender,
          birthdate: birthdate);
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
  ResultVoid deleteHierings({required int id}) async {
    try {
      final result = await baseHieringRemoteDataSource.delelteHiering(id: id);
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
  ResultFuture<Hiering> getHiering({required int id}) async {
    try {
      final result = await baseHieringRemoteDataSource.getHiering(id: id);
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
  ResultFuture<List<Hiering>> getHierings() async {
    try {
      final result = await baseHieringRemoteDataSource.getHierings();
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
  ResultVoid updateHierings(
      {required int id,
      required String firstName,
      required String lastName,
      required String email,
      required String phoneNumber,
      required String vehiclePlateNumber,
      required String idNumber,
      required bool isAccepted,
      required int jobOfferId,
      required Gender gender,
      required String birthdate}) async {
    try {
      final result = await baseHieringRemoteDataSource.updateHiering(
          id: id,
          firstName: firstName,
          lastName: lastName,
          email: email,
          phoneNumber: phoneNumber,
          vehiclePlateNumber: vehiclePlateNumber,
          idNumber: idNumber,
          jobOfferId: jobOfferId,
          gender: gender,
          birthdate: birthdate);
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
}
