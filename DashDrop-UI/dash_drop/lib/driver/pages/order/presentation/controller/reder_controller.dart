import 'package:dash_drop/core/usecase/base_usecase.dart';
import 'package:get/get.dart';

import '../../domain/entities/order.dart';
import '../../domain/usecase/get_order.dart';
class OrderDriverController extends GetxController with StateMixin<List<BoxOrder>>  {
  final GetOrderDriverUseCase _getOrderUseCase;

  OrderDriverController(this._getOrderUseCase);

  static OrderDriverController get to => Get.find<OrderDriverController>();

  Future<void> fetchOrders() async {
    // print('Fetching orders...');
    // change(null, status: RxStatus.loading()); 
    final result = await _getOrderUseCase(const NoParameters());

    result.fold(
      (error) {
        change(null,
            status: RxStatus.error(error.message)); 
      },
      (orderData) {
        change(orderData, status: RxStatus.success()); 
      },
    );
  }
  
 
}
 
