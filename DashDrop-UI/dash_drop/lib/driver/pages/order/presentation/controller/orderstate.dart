import 'package:equatable/equatable.dart';

import '../../domain/entities/order.dart';

class OrderState extends Equatable {
  final List<BoxOrder> orders;

  const OrderState({required this.orders});

  @override
  List<Object?> get props => [orders];
}
