// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dash_drop/core/usecase/base_usecase.dart';
import 'package:dash_drop/core/utils/typedef.dart';
import 'package:dash_drop/pages/send_order/data/model/create_order_model.dart';
import 'package:equatable/equatable.dart';

import '../repository/base_send_order_repository.dart';

class CreateOrderUseCase extends BaseUseCase<String, CreateOrderParameters> {
  CreateOrderUseCase(this.sendOrderRepository);

  final BaseSendOrderRepository sendOrderRepository;

  @override
  ReceivingCode call(CreateOrderParameters parameters) async =>
      sendOrderRepository.makeOrder(createOrder: parameters.createOrderModel);
}

class CreateOrderParameters extends Equatable {
  final CreateOrderModel createOrderModel;
  const CreateOrderParameters({
    required this.createOrderModel,
  });

  @override
  List<Object> get props => [createOrderModel];
}
