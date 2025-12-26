import 'package:dartz/dartz.dart';
import 'package:dash_drop/core/error/exceptions.dart';
import 'package:dash_drop/core/error/failure.dart';
import 'package:dash_drop/core/utils/typedef.dart';
import 'package:dash_drop/pages/order/data/data_source/order_remote_data_source.dart';
import 'package:dash_drop/pages/order/domain/entities/order.dart';
import 'package:dash_drop/pages/order/domain/repository/base_order_repository.dart';

class OrderRepository extends BaseOrdersRepository {
  OrderRepository(this._baseOrderRemoteDataSource);

  final BaseOrderRemoteDataSource _baseOrderRemoteDataSource;

  @override
  ResultFuture<List<BoxOrder>> getOrders() async {
    final result = await _baseOrderRemoteDataSource.getOrder();
   
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
