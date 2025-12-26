import 'package:dartz/dartz.dart';
import 'package:dash_drop_dashboard/core/error/exceptions.dart';
import 'package:dash_drop_dashboard/core/error/failure.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/data/data_source/vehicle_remote_data_source.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/domain/entities/vehicle.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/domain/repository/base_vehicles_repository.dart';

class VehicleRepository extends BaseVehicleRepository {
  final BaseVehicleDataSource baseVehicleDataSource;

  VehicleRepository({required this.baseVehicleDataSource});

  @override
  ResultFuture<Vehicle> createVehicle(
      {required double costPerKm,
      required int avgSpeedKm,
      required int maxRangekm,
      required double maxCapacityCubicM,
      required int maxWeightKg,
      required SensitivityLevels sensitivityLevel,
      required VehicleTypes type,
      required String specifications}) async {
    try {
      final result = await baseVehicleDataSource.createVehicle(
          costPerKm: costPerKm,
          avgSpeedKm: avgSpeedKm,
          maxRangekm: maxRangekm,
          maxCapacityCubicM: maxCapacityCubicM,
          maxWeightKg: maxWeightKg,
          sensitivityLevel: sensitivityLevel,
          type: type,
          specifications: specifications);
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
  ResultVoid deleteVehicle({required int id}) async {
    try {
      final result = await baseVehicleDataSource.delelteVehicle(id: id);
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
  ResultFuture<Vehicle> getVehicle({required int id}) async {
    try {
      final result = await baseVehicleDataSource.getVehicle(id: id);
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
  ResultFuture<List<Vehicle>> getVehicles() async {
    try {
      final result = await baseVehicleDataSource.getVehicles();
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
  ResultVoid updateVehicle(
      {required int id,
      required double costPerKm,
      required int avgSpeedKm,
      required int maxRangekm,
      required double maxCapacityCubicM,
      required int maxWeightKg,
      required SensitivityLevels sensitivityLevel,
      required VehicleTypes type,
      required String specifications}) async {
    try {
      final result = await baseVehicleDataSource.updateVehicle(
          id: id,
          costPerKm: costPerKm,
          avgSpeedKm: avgSpeedKm,
          maxRangekm: maxRangekm,
          maxCapacityCubicM: maxCapacityCubicM,
          maxWeightKg: maxWeightKg,
          sensitivityLevel: sensitivityLevel,
          type: type,
          specifications: specifications);
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
