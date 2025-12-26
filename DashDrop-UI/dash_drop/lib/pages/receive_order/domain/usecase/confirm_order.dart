// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dash_drop/core/usecase/base_usecase.dart';
import 'package:dash_drop/core/utils/typedef.dart';
import 'package:equatable/equatable.dart';

import '../repository/base_auth_repository.dart';

class ConfirmOrderUseCase extends BaseUseCase<void, ConfirmOrderParameters> {
  ConfirmOrderUseCase(this.receiveOrderRepository);

  final BaseReceiveOrderRepository receiveOrderRepository;

  @override
  ResultVoid call(ConfirmOrderParameters parameters) async =>
      receiveOrderRepository.confirmOrder(
        destinationLocation: parameters.destinationLocation,
        destinationAddress: parameters.destinationAddress,
        receivingCode: parameters.receivingCode,
        polyline: parameters.polyline,
        pathLengthKm: parameters.pathLengthKm,
      );
}

class ConfirmOrderParameters extends Equatable {
  final String destinationLocation;
  final String destinationAddress;
  final String receivingCode;
  final String polyline;
  final double pathLengthKm;
  const ConfirmOrderParameters({
    required this.destinationLocation,
    required this.destinationAddress,
    required this.receivingCode,
    required this.polyline,
    required this.pathLengthKm,
  });

  @override
  List<Object> get props {
    return [
      destinationLocation,
      destinationAddress,
      receivingCode,
      polyline,
      pathLengthKm,
    ];
  }
}
