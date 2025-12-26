// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dash_drop/core/usecase/base_usecase.dart';
import 'package:dash_drop/core/utils/typedef.dart';
import 'package:dash_drop/custom_widgets/lat_lng.dart';
import 'package:dash_drop/pages/receive_order/domain/entities/polyline_info.dart';
import 'package:dash_drop/pages/receive_order/domain/entities/sender_location.dart';
import 'package:equatable/equatable.dart';

import '../repository/base_auth_repository.dart';

class GetPolylineUseCase extends BaseUseCase<PolylineInfo, GetPolylineParameters> {
  GetPolylineUseCase(this.receiveOrderRepository);

  final BaseReceiveOrderRepository receiveOrderRepository;

  @override
  ResultFuture<PolylineInfo> call(GetPolylineParameters parameters) async =>
      receiveOrderRepository.getPolyline(
          origin: parameters.origin, destination: parameters.destination);
}

class GetPolylineParameters extends Equatable {
  final LatLng1 origin;
  final LatLng1 destination;

  const GetPolylineParameters({
    required this.origin,
    required this.destination,
  });

  @override
  List<Object> get props => [origin, destination];
}
