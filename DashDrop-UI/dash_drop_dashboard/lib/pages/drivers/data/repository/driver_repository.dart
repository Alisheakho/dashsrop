import 'package:dartz/dartz.dart';
import 'package:dash_drop_dashboard/core/error/exceptions.dart';
import 'package:dash_drop_dashboard/core/error/failure.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/drivers/data/data_source/driver_remote_data_source.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/entities/drivers.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/entities/regions.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/entities/vehicle_details.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/repository/base_drivers_repository.dart';

class DriverRepository extends BaseDriversRepository {
  final BaseDriverRemoteDataSource baseDriverRemoteDataSource;

  DriverRepository({required this.baseDriverRemoteDataSource});

  @override
  ResultFuture<Drivers> createDrivers(
      {required String firstName,
      required String lastName,
      required String userID,
      required String phoneNumber,
      required String vehiclePlateNumber,
      required String password,
      required String idNumber,
      required int regionId,
      required int vehicleDetailId,
      required int gender,
      required String birthdate}) async {
    try {
      final result = await baseDriverRemoteDataSource.createDriver(
          firstName: firstName,
          lastName: lastName,
          userID: userID,
          phoneNumber: phoneNumber,
          gender: gender,
          birthdate: birthdate,
          vehiclePlateNumber: vehiclePlateNumber,
          password: password,
          idNumber: idNumber,
          regionId: regionId,
          vehicleDetailId: vehicleDetailId);
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
  ResultVoid deleteDrivers({required int id}) async {
    final result = await baseDriverRemoteDataSource.delelteDriver(id: id);
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
  ResultFuture<Drivers> getDriver({required int id}) async {
    try {
      final result = await baseDriverRemoteDataSource.getDriver(id: id);
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
  ResultFuture<List<Drivers>> getDrivers() async {
    final result = await baseDriverRemoteDataSource.getDrivers();
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
  ResultVoid updateDrivers(
      {required int id,
      required String firstName,
      required String lastName,
      required String userID,
      required String phoneNumber,
      required String vehiclePlateNumber,
      required String password,
      required String idNumber,
      required int regionId,
      required int vehicleDetailId,
      required int gender,
      required String birthdate}) async {
    final result = await baseDriverRemoteDataSource.updateDriver(
        id: id,
        firstName: firstName,
        lastName: lastName,
        userID: userID,
        phoneNumber: phoneNumber,
        gender: gender,
        birthdate: birthdate,
        vehiclePlateNumber: vehiclePlateNumber,
        password: password,
        idNumber: idNumber,
        regionId: regionId,
        vehicleDetailId: vehicleDetailId);
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
  ResultFuture<List<Regions>> getRegions() async {
    final result = await baseDriverRemoteDataSource.getRegions();
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
  ResultFuture<List<VehicleDetails>> getVehicleDetails() async {
    final result = await baseDriverRemoteDataSource.getVehicleDetails();
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
}
