import 'package:dash_drop/pages/order/domain/entities/order.dart';
import 'package:dash_drop/pages/order/domain/usecase/get_order.dart';
import 'package:get/get.dart';
import '../../../../core/usecase/base_usecase.dart';

class OrderController extends GetxController with StateMixin<List<BoxOrder>>  {
  final GetOrderUseCase _getOrderUseCase;

  OrderController(this._getOrderUseCase);

  static OrderController get to => Get.find<OrderController>();

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
 
