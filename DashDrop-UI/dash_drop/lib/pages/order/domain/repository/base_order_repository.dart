

import 'package:dash_drop/core/utils/typedef.dart';
import 'package:dash_drop/pages/order/domain/entities/order.dart';

abstract class BaseOrdersRepository {
  ResultFuture<List<BoxOrder>> getOrders();

}