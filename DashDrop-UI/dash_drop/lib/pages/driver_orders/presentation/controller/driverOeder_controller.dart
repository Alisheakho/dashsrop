import 'package:dash_drop/pages/driver_orders/domain/entities/order.dart';
import 'package:dash_drop/pages/driver_orders/domain/usecase/get_order.dart';
import 'package:get/get.dart';
import '../../../../core/usecase/base_usecase.dart';

class DriverOrderController extends GetxController with StateMixin<List<DriverBoxOrder>>  {
  final GetDriverOrderUseCase _getDriverOrderUseCase;

  DriverOrderController(this._getDriverOrderUseCase);

  static DriverOrderController get to => Get.find<DriverOrderController>();

  Future<void> fetchOrders() async {
    print('Fetching orders...');
    change(null, status: RxStatus.loading()); 
    final result = await _getDriverOrderUseCase(const NoParameters());

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
 
