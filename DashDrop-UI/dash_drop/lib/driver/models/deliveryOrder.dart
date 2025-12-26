import 'package:dash_drop/core/utils/enums.dart';
import 'package:dash_drop/driver/models/reciver.dart';
import 'package:dash_drop/driver/models/sender.dart';
import 'package:equatable/equatable.dart';

class DeliveryOrder extends Equatable {
  final int id;
  final double deliveryCost;
  final double extraProfitRate;
  final String estimatedTime;
  final double pathLengthKm;
  final String destinationLocation;
  final String destinationLocationDescription;
  final String sourceLocation;
  final String receivingCode;
  final String sourceLocationDescription;
  final String polyLine;
  final int paymentResponsibility;
  final DeliveryState status;
  final Reciver reciverCustomer;
  final Sender senderCustomer;

  const DeliveryOrder(
      {required this.id,
      required this.deliveryCost,
      required this.estimatedTime,
      required this.extraProfitRate,
      required this.pathLengthKm,
      required this.receivingCode,
      required this.destinationLocation,
      required this.destinationLocationDescription,
      required this.paymentResponsibility,
      required this.sourceLocation,
      required this.polyLine,
      required this.sourceLocationDescription,
      required this.status,
      required this.reciverCustomer,
      required this.senderCustomer});

  factory DeliveryOrder.fromJson(Map<String, dynamic> map) {
    return DeliveryOrder(
        id: map['id'],
        deliveryCost: map['deliveryCost'] as double,
        destinationLocation: map['destinationLocation'],
        destinationLocationDescription:
            map['destinationLocationDescription'] ?? '',
        estimatedTime: map['estimatedTime'],
        receivingCode: map['receivingCode'],
        extraProfitRate: map['extraProfitRate'].toDouble() as double,
        pathLengthKm: map['pathLengthKm'] as double,
        sourceLocation: map['sourceLocation'],
        paymentResponsibility: map['paymentResponsibility'],
        sourceLocationDescription: map['sourceLocationDescription'],
        polyLine: map['polyLine'],
        status: DeliveryState.values
            .map((e) {
              if (e.index == map['status']) {
                return e;
              }
            })
            .nonNulls
            .first,
        reciverCustomer: Reciver.fromJson(map['reciverCustomer']),
        senderCustomer: Sender.fromJson(map['senderCustomer']));
  }

  @override
  List<Object?> get props => [
        id,
        deliveryCost,
        estimatedTime,
        extraProfitRate,
        pathLengthKm,
        destinationLocation,
        destinationLocationDescription,
        receivingCode,
        paymentResponsibility,
        sourceLocation,
        sourceLocationDescription,
        polyLine,
        status,
        reciverCustomer,
        senderCustomer
      ];
}
/*
"deliveryOrder": {
        "id": 6,
        "createdAt": "2024-08-23T17:18:49.4833567Z",
        "lastUpdatedAt": "2024-08-23T17:18:49.4833442Z",
        "declinesCount": 0,
        "deliveryCost": 50,
        "destinationLocation": "36.57514097632355,37.012255410993895",
        "destinationLocationDescription": null,
        "driver": null,
        "estimatedTime": "00:00:00",
        "extraProfitRate": 0,
        "pathLengthKm": 0,
        "paymentResponsibility": 0,
        "polyLine": null,
        "receivingCode": "OnlyForTestingDon'tUse",
    
        "sourceLocation": "36.610126801450036,37.06370499224136",
        "sourceLocationDescription": "Building 4, appartment number 0012",
        "status": 1,
       
    },

 */