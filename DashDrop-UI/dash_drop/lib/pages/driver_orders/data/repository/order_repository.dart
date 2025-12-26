import 'package:dartz/dartz.dart';
import 'package:dash_drop/core/error/exceptions.dart';
import 'package:dash_drop/core/error/failure.dart';
import 'package:dash_drop/core/utils/typedef.dart';
import 'package:dash_drop/pages/driver_orders/data/data_source/order_remote_data_source.dart';
import 'package:dash_drop/pages/driver_orders/domain/entities/order.dart';
import 'package:dash_drop/pages/driver_orders/domain/repository/base_order_repository.dart';


class DriverOrderRepository extends BaseDriverOrdersRepository {
  DriverOrderRepository(this._baseDriverOrderRemoteDataSource);

  final BaseDriverOrderRemoteDataSource _baseDriverOrderRemoteDataSource;

  @override
  ResultFuture<List<DriverBoxOrder>> getOrders() async {
    final result = await _baseDriverOrderRemoteDataSource.getOrder();
   
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
