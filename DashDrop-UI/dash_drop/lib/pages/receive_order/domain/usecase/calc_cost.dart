// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dash_drop/core/usecase/base_usecase.dart';
import 'package:dash_drop/core/utils/typedef.dart';
import 'package:dash_drop/pages/receive_order/domain/entities/cost_info.dart';
import 'package:equatable/equatable.dart';

import '../repository/base_auth_repository.dart';

class CalcCostUseCase extends BaseUseCase<CostInfo, CalcCostParameters> {
  CalcCostUseCase(this.receiveOrderRepository);

  final BaseReceiveOrderRepository receiveOrderRepository;

  @override
  ResultFuture<CostInfo> call(CalcCostParameters parameters) async =>
      receiveOrderRepository.calcCost(
          receivingCode: parameters.receivingCode, pathLengthKm: parameters.pathLengthKm);
}

class CalcCostParameters extends Equatable {
  final String receivingCode;
  final double pathLengthKm;

  const CalcCostParameters({
    required this.receivingCode,
    required this.pathLengthKm,
  });

  @override
  List<Object> get props => [receivingCode, pathLengthKm];
}
