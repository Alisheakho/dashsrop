

import 'package:dash_drop/core/utils/typedef.dart';
import 'package:dash_drop/driver/pages/order/domain/entities/order.dart';

abstract class BaseOrdersDriverRepository {
  ResultFuture<List<BoxOrder>> getOrders();

}