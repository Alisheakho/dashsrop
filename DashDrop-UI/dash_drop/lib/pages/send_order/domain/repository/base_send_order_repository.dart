import 'package:dash_drop/core/utils/typedef.dart';
import 'package:dash_drop/pages/send_order/data/model/create_order_model.dart';

abstract class BaseSendOrderRepository {
  ReceivingCode makeOrder({required CreateOrderModel createOrder});
}
