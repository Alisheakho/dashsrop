
import 'package:dash_drop/core/usecase/base_usecase.dart';
import 'package:dash_drop/core/utils/typedef.dart';
import 'package:dash_drop/driver/pages/order/domain/entities/order.dart';

import '../repository/base_order_repository.dart';

class GetOrderDriverUseCase extends BaseUseCase<List<BoxOrder>, NoParameters> {
  GetOrderDriverUseCase(this.orderRepository);

  final BaseOrdersDriverRepository orderRepository;

  @override
  ResultFuture<List<BoxOrder>> call(NoParameters parameters) async {
    return await orderRepository.getOrders();
  }
}
