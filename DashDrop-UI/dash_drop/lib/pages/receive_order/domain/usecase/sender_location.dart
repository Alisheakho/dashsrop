import 'package:dash_drop/pages/receive_order/domain/entities/sender_location.dart';
import 'package:equatable/equatable.dart';
import 'package:dash_drop/core/usecase/base_usecase.dart';
import 'package:dash_drop/core/utils/typedef.dart';
import '../repository/base_auth_repository.dart';

class SenderLocationUseCase extends BaseUseCase<SenderLocation, SenderLocationParameters> {
  SenderLocationUseCase(this.receiveOrderRepository);

  final BaseReceiveOrderRepository receiveOrderRepository;

  @override
  ResultFuture<SenderLocation> call(SenderLocationParameters parameters) async => receiveOrderRepository
      .receiveSenderLocation(receivingCode: parameters.receivingCode);
}

class SenderLocationParameters extends Equatable {
  const SenderLocationParameters({
    required this.receivingCode,
  });

  final String receivingCode;

  @override
  List<Object?> get props => [receivingCode];
}
