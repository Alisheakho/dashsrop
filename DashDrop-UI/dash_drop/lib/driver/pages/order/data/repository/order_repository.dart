
import 'package:dartz/dartz.dart';
import 'package:dash_drop/core/error/exceptions.dart';
import 'package:dash_drop/core/error/failure.dart';
import 'package:dash_drop/core/utils/typedef.dart';

import '../../domain/entities/order.dart';
import '../../domain/repository/base_order_repository.dart';
import '../data_source/order_remote_data_source.dart';

class OrderDriverRepository extends BaseOrdersDriverRepository {
  OrderDriverRepository(this._baseOrderRemoteDataSource);

  final BaseOrderDriverRemoteDataSource _baseOrderRemoteDataSource;

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
