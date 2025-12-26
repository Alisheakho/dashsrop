import 'package:dash_drop/driver/models/deliveryOrder.dart';
import 'package:equatable/equatable.dart';

class Reciving extends Equatable {
  final int id;
  final int priority;
  final DeliveryOrder deliveryOrder;
  const Reciving(
      {required this.id, required this.priority, required this.deliveryOrder});
  factory Reciving.fromJson(Map<String, dynamic> map) {
    return Reciving(
        id: map['id'],
        priority: map['priority']??0,
        deliveryOrder: DeliveryOrder.fromJson(map['deliveryOrder']));
  }

  @override
  List<Object?> get props => [id, deliveryOrder];
}
/**
 {
    "id": 5,
    "priority": 1,
    "offerStatus": 0,
    "deliveryOrderId": 6,
    "createdAt": "2024-08-23T17:18:49.6269167Z",
    
    "searchRadius": 2.5
}
 */