import 'package:dash_drop/core/usecase/base_usecase.dart';
import 'package:dash_drop/core/utils/typedef.dart';
import 'package:dash_drop/pages/driver_orders/domain/entities/order.dart';
import 'package:dash_drop/pages/driver_orders/domain/repository/base_order_repository.dart';


class GetDriverOrderUseCase extends BaseUseCase<List<DriverBoxOrder>, NoParameters> {
  GetDriverOrderUseCase(this.orderRepository);

  final BaseDriverOrdersRepository orderRepository;

  @override
  ResultFuture<List<DriverBoxOrder>> call(NoParameters parameters) async {
    return await orderRepository.getOrders();
  }
}
