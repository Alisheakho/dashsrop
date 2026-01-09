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
  ResultVoid login({required String userID, required String password}) async {
    try {
      // --- DEBUG PRINT 1: START ---
      print("AuthRepository: Attempting login...");
      print("AuthRepository: User: $userID, Pass: $password");

      final JwtModel result = await _baseUserRemoteDataSource.login(
          userID: userID, password: password);

      // --- DEBUG PRINT 2: SUCCESS ---
      print("AuthRepository: Login successful. Response: $result");

      await _baseUserLocalDataSource.storeToken(jwt: result);
      return const Right(null);
    } on AuthException catch (failure) {
      // --- DEBUG PRINT 3: API ERROR ---
      print("AuthRepository: Caught AuthException");
      print("AuthRepository: Message: ${failure.authMessage}");
      print("AuthRepository: StatusCode: ${failure.statusCode}");

      // If the message is null, we return a clearer error instead of just empty string
      return Left(ServerFailure(
          message: failure.authMessage ?? 'Error message is NULL from server',
          statusCode: failure.statusCode ?? 404));
    } catch (e) {
      // --- DEBUG PRINT 4: UNEXPECTED CRASH ---
      // This catches things like JSON parsing errors or Connection Refused
      print("AuthRepository: UNEXPECTED ERROR: $e");
      return Left(ServerFailure(message: e.toString(), statusCode: 500));
    }
  }

  @override
  ResultVoid resetPassword(
      {required String userID,
      required String oldPassword,
      required String newPassword}) async {
    try {
      await _baseUserRemoteDataSource.retsetPassword(
          userID: userID, oldPassword: oldPassword, newPassword: newPassword);
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
