import 'package:dartz/dartz.dart';
import 'package:dash_drop_dashboard/core/error/exceptions.dart';
import 'package:dash_drop_dashboard/core/error/failure.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/employees/domain/entities/employee.dart';

import '../../domain/repository/base_employees_repository.dart';
import '../data_source/employee_remote_data_source.dart';

class EmployeesRepository extends BaseEmployeesRepository {
  EmployeesRepository(this._baseEmployeeRemoteDataSource);

  final BaseEmployeeRemoteDataSource _baseEmployeeRemoteDataSource;

  @override
  ResultFuture<List<Employee>> getEmployees() async {
    final result = await _baseEmployeeRemoteDataSource.getEmployees();
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
  ResultFuture<Employee> createEmployee(
      {required String firstName,
      required String lastName,
      required String userID,
      required String password,
      required String phoneNumber,
      required String title,
      required Gender gender,
      required String birthdate}) async {
    final result = await _baseEmployeeRemoteDataSource.createEmployee(
        firstName: firstName,
        lastName: lastName,
        userID: userID,
        password: password,
        phoneNumber: phoneNumber,
        title: title,
        gender: gender,
        birthdate: birthdate);
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
  ResultFuture<Employee> getEmployee({required int id}) async {
    final result = await _baseEmployeeRemoteDataSource.getEmployee(id: id);

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
  ResultVoid deleteEmployee({required int id}) async {
    final result = _baseEmployeeRemoteDataSource.delelteEmployee(id: id);

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
  ResultVoid updateEmployee(
      {required int id,
      required String firstName,
      required String lastName,
      required String userID,
      required String password,
      required String phoneNumber,
      required String title,
      required Gender gender,
      required String birthdate}) async {
    await _baseEmployeeRemoteDataSource.updateEmployee(
        id: id,
        firstName: firstName,
        lastName: lastName,
        userID: userID,
        password: password,
        phoneNumber: phoneNumber,
        title: title,
        gender: gender,
        birthdate: birthdate);
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
