import 'package:dartz/dartz.dart';
import 'package:dash_drop/core/error/exceptions.dart';
import 'package:dash_drop/core/error/failure.dart';
import 'package:dash_drop/core/utils/typedef.dart';
import 'package:dash_drop/custom_widgets/lat_lng.dart';
import 'package:dash_drop/pages/receive_order/domain/entities/cost_info.dart';
import 'package:dash_drop/pages/receive_order/domain/entities/polyline_info.dart';
import 'package:dash_drop/pages/receive_order/domain/entities/sender_location.dart';

import '../../domain/repository/base_auth_repository.dart';
import '../data_source/receive_order_remote_data_source.dart';

class ReceiveOrderRepository extends BaseReceiveOrderRepository {
  ReceiveOrderRepository(this._baseReceiveOrderRemoteDataSource);

  final BaseReceiveOrderRemoteDataSource _baseReceiveOrderRemoteDataSource;

  @override
  ResultFuture<SenderLocation> receiveSenderLocation(
      {required String receivingCode}) async {
    try {
      final SenderLocation result = await _baseReceiveOrderRemoteDataSource
          .receiveSenderLocation(receivingCode: receivingCode);
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
  ResultFuture<PolylineInfo> getPolyline(
      {required LatLng1 origin, required LatLng1 destination}) async {
    try {
      final result = await _baseReceiveOrderRemoteDataSource.getPolyline(
          origin: origin, destination: destination);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.message,
          statusCode: failure.errorMessageModel.statusCode,
          errors: failure.errorMessageModel.errors));
    }
  }

  @override
  ResultFuture<CostInfo> calcCost(
      {required String receivingCode, required double pathLengthKm}) async {
    try {
      final result = await _baseReceiveOrderRemoteDataSource.calcCost(
          receivingCode: receivingCode, pathLengthKm: pathLengthKm);
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
  ResultVoid confirmOrder(
      {required String destinationLocation,
      required String destinationAddress,
      required String receivingCode,
      required String polyline,
      required double pathLengthKm}) async {
    try {
      await _baseReceiveOrderRemoteDataSource.confirmOrder(
           destinationLocation : destinationLocation,
           destinationAddress : destinationAddress,
           receivingCode : receivingCode,
           polyline : polyline,
           pathLengthKm : pathLengthKm,
          );
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
