import 'package:dartz/dartz.dart';
import 'package:dash_drop/core/error/exceptions.dart';
import 'package:dash_drop/core/error/failure.dart';
import 'package:dash_drop/core/utils/typedef.dart';
import 'package:dash_drop/pages/send_order/data/model/create_order_model.dart';

import '../../domain/repository/base_send_order_repository.dart';
import '../data_source/send_order_remote_data_source.dart';

class SendOrderRepository extends BaseSendOrderRepository {
  SendOrderRepository(this._baseSendOrderRemoteDataSource);

  final BaseSendOrderRemoteDataSource _baseSendOrderRemoteDataSource;

  @override
  ReceivingCode makeOrder({required CreateOrderModel createOrder}) async {
    try {
      final String result =
          await _baseSendOrderRemoteDataSource.makeOrder(createOrder: createOrder);
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
}
