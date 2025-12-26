import 'package:dash_drop/core/usecase/base_usecase.dart';
import 'package:dash_drop/core/utils/typedef.dart';
import 'package:dash_drop/pages/order/domain/entities/order.dart';
import 'package:dash_drop/pages/order/domain/repository/base_order_repository.dart';

class GetOrderUseCase extends BaseUseCase<List<BoxOrder>, NoParameters> {
  GetOrderUseCase(this.orderRepository);

  final BaseOrdersRepository orderRepository;

  @override
  ResultFuture<List<BoxOrder>> call(NoParameters parameters) async {
    return await orderRepository.getOrders();
  }
}
