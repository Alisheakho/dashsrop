import 'package:dash_drop/core/utils/enums.dart';
import 'package:dash_drop/core/utils/typedef.dart';
import 'package:dash_drop/custom_widgets/custom_util.dart';
import 'package:dash_drop/pages/receive_order/domain/entities/polyline_info.dart';
import 'package:dash_drop/pages/receive_order/domain/entities/sender_location.dart';

import '../entities/cost_info.dart';

abstract class BaseReceiveOrderRepository {
  ResultFuture<SenderLocation> receiveSenderLocation(
      {required String receivingCode});

  ResultFuture<PolylineInfo> getPolyline(
      {required LatLng1 origin, required LatLng1 destination});

  ResultFuture<CostInfo> calcCost({required String receivingCode,required double pathLengthKm});

  ResultVoid confirmOrder(
      {required String destinationLocation,
      required String destinationAddress,
      required String receivingCode,
      required String polyline,
      required double pathLengthKm});
}
