import 'package:dartz/dartz.dart';
import 'package:dash_drop_dashboard/core/error/exceptions.dart';
import 'package:dash_drop_dashboard/core/error/failure.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/customers/data/data_source/customer_remote_data_source.dart';
import 'package:dash_drop_dashboard/pages/customers/domain/entities/customer.dart';
import 'package:dash_drop_dashboard/pages/customers/domain/repository/base_customer_repository.dart';




class CustomersRepository extends BaseCustomersRepository {
CustomersRepository(this._baseCustomerRemoteDataSource);

  final BaseCustomerRemoteDataSource _baseCustomerRemoteDataSource;

  @override
  ResultFuture<List<Customer>>  getCustomer() async {
    final result = await _baseCustomerRemoteDataSource.getCustomer();
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
  ResultVoid  deleteCustomer({required int id}) async {
    final result = _baseCustomerRemoteDataSource.delelteCustomer(id: id);

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
