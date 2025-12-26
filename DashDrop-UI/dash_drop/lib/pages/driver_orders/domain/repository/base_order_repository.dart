

import 'package:dash_drop/core/utils/typedef.dart';
import 'package:dash_drop/pages/driver_orders/domain/entities/order.dart';


abstract class BaseDriverOrdersRepository {
  ResultFuture<List<DriverBoxOrder>> getOrders();

}