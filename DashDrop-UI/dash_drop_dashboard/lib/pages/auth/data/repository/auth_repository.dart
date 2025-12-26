import 'package:dartz/dartz.dart';
import 'package:dash_drop_dashboard/core/error/exceptions.dart';
import 'package:dash_drop_dashboard/core/error/failure.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/auth/data/data_source/user_local_data_source.dart';
import 'package:dash_drop_dashboard/pages/auth/data/data_source/user_remote_data_source.dart';
import 'package:dash_drop_dashboard/pages/auth/data/model/jwt_model.dart';
import 'package:dash_drop_dashboard/pages/auth/domain/entities/user.dart';
import 'package:dash_drop_dashboard/pages/auth/domain/repository/base_auth_repository.dart';

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
      return const Right(null);
    } on AuthException catch (failure) {
      return Left(ServerFailure(
          message: failure.authMessage ?? '',
          statusCode: failure.statusCode ?? 404));
    }
  }

  @override
  ResultVoid resetPassword(
      {required String email,
      required String oldPassword,
      required String newPassword}) async {
    try {
      await _baseUserRemoteDataSource.retsetPassword(
          email: email, oldPassword: oldPassword, newPassword: newPassword);
      return const Right(null);
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
