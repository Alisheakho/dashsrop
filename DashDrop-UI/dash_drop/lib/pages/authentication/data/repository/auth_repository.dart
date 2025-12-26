import 'package:dartz/dartz.dart';
import 'package:dash_drop/core/error/exceptions.dart';
import 'package:dash_drop/core/error/failure.dart';
import 'package:dash_drop/core/utils/enums.dart';
import 'package:dash_drop/core/utils/typedef.dart';
import 'package:dash_drop/pages/authentication/data/data_source/auth_local_data_source.dart';
import 'package:dash_drop/pages/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:dash_drop/pages/authentication/data/model/jwt_model.dart';
import 'package:dash_drop/pages/authentication/domain/entities/user.dart';
import 'package:dash_drop/pages/authentication/domain/repository/base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  AuthRepository(this._baseUserRemoteDataSource, this._baseUserLocalDataSource);

  final BaseUserRemoteDataSource _baseUserRemoteDataSource;
  final BaseUserLocalDataSource _baseUserLocalDataSource;

  @override
  ResultFuture<User> getUser() async {
    final result = await _baseUserLocalDataSource.getUser();
    try {
      return Right(result);
    } on DatabaseFailure catch (failure) {
      return Left(failure);
    }
  }

  @override
  ResultVoid login({required String email, required String password}) async {
    try {
      final JwtModel result = await _baseUserRemoteDataSource.login(
          email: email, password: password);
      await _baseUserLocalDataSource.storeToken(jwt: result);
      print(result.token);
      return const Right(null);
    } on AuthException catch (failure) {
      return Left(ServerFailure(
          message: failure.authMessage ?? '',
          statusCode: failure.statusCode ?? 404));
    }
  }

  @override
  ResultVoid register(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String phoneNumber,
      required Gender gender,
      required String birthdate}) async {
    try {
      await _baseUserRemoteDataSource.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        gender: gender,
        birthdate: birthdate,
      );
      return const Right(null);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.message,
          statusCode:
              failure.statusCode ?? failure.errorMessageModel.statusCode,
          errors: failure.errorMessageModel.errors));
    } on AuthException catch (failure) {
      return Left(ServerFailure(
          message: failure.authMessage ?? '',
          statusCode: failure.statusCode ?? 404));
    }
  }

  @override
  ResultFuture<bool> isAuthorized() async {
    final result = await _baseUserLocalDataSource.isAuthorized();
    try {
      return Right(result);
    } on AuthException catch (failure) {
      return Left(ServerFailure(
          message: failure.authMessage ?? '',
          statusCode: failure.statusCode ?? 404));
    }
  }

  @override
  ResultVoid logout() async {
    final result = await _baseUserLocalDataSource.logout();
    try {
      return Right(result);
    } on AuthException catch (failure) {
      return Left(ServerFailure(
          message: failure.authMessage ?? '',
          statusCode: failure.statusCode ?? 404));
    }
  }
}
