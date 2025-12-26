import 'package:dash_drop/core/utils/typedef.dart';

import '../../domain/entities/order.dart';

class DriverOrderModel extends DriverBoxOrder {
  const DriverOrderModel({
    required super.id,
    required super.extraProfitRate,
    required super.estimatedTime,
    required super.status,
    required super.paymentResponsibility,
    required super.polyLine,
    required super.pathLengthKm,
    required super.deliveryCost,
    required super.offersCount,
    required super.declinesCount,
    required super.sourceLocation,
    required super.sourceLocationDescription,
    required super.destinationLocation,
    required super.destinationLocationDescription,
    required super.receivingCode,
    required super.senderCustomer,
    required super.reciverCustomer,
    required super.vehicleDetail,
    required super.createdAt,
    required super.lastUpdatedAt,
    required super.acceptedAt,
    required super.deleiveredAt,
  });
  factory DriverOrderModel.fromJson(DataMap map) {
    return DriverOrderModel(
      id: map['id'] as int,
      extraProfitRate: map['extraProfitRate'] as double?,
      estimatedTime: map['estimatedTime'] as String? ,
      status: map['status'] as int,
      paymentResponsibility: map['paymentResponsibility'] as int?,
      polyLine: map['polyLine'] as String?,
      pathLengthKm: map['pathLengthKm'] as double?,
      deliveryCost: map['deliveryCost'] as double?,
      offersCount: map['offersCount'] as int?,
      declinesCount: map['declinesCount'] as int?,
      sourceLocation: map['sourceLocation'] as String? ,
      sourceLocationDescription: map['sourceLocationDescription'] as String? ,
      destinationLocation: map['destinationLocation'] as String? ,
      destinationLocationDescription:
          map['destinationLocationDescription'] as String? ,
      receivingCode: map['receivingCode'] as String? ,
      senderCustomer: map['senderCustomer'] as Map<String, dynamic>,
      reciverCustomer: map['reciverCustomer'] as Map<String, dynamic>?,
      vehicleDetail: map['vehicleDetail'] as Map<String, dynamic>?,
      createdAt: map['createdAt'] as String? ,
      lastUpdatedAt: map['lastUpdatedAt'] as String? ,
      acceptedAt: map['acceptedAt'] as String?,
      deleiveredAt: map['deleiveredAt'] as String? ,
    );
  }

  DriverOrderModel copyWith({
    int? id,
    double? extraProfitRate,
    String? estimatedTime,
    int? status,
    int? paymentResponsibility,
    String? polyLine,
    double? pathLengthKm,
    double? deliveryCost,
    int? offersCount,
    int? declinesCount,
    String? sourceLocation,
    String? sourceLocationDescription,
    String? destinationLocation,
    String? destinationLocationDescription,
    String? receivingCode,
    Map<String, dynamic>? senderCustomer,
    Map<String, dynamic>? reciverCustomer,
    Map<String, dynamic>? vehicleDetail,
    String? createdAt,
    String? lastUpdatedAt,
    String? acceptedAt,
    String? deleiveredAt,
  }) {
    return DriverOrderModel(
      id: id ?? this.id,
      extraProfitRate: extraProfitRate ?? this.extraProfitRate,
      estimatedTime: estimatedTime ?? this.estimatedTime,
      status: status ?? this.status,
      paymentResponsibility:
          paymentResponsibility ?? this.paymentResponsibility,
      polyLine: polyLine ?? this.polyLine,
      pathLengthKm: pathLengthKm ?? this.pathLengthKm,
      deliveryCost: deliveryCost ?? this.deliveryCost,
      offersCount: offersCount ?? this.offersCount,
      declinesCount: declinesCount ?? this.declinesCount,
      sourceLocation: sourceLocation ?? this.sourceLocation,
      sourceLocationDescription:
          sourceLocationDescription ?? this.sourceLocationDescription,
      destinationLocation: destinationLocation ?? this.destinationLocation,
      destinationLocationDescription:
          destinationLocationDescription ?? this.destinationLocationDescription,
      receivingCode: receivingCode ?? this.receivingCode,
      senderCustomer: senderCustomer ?? this.senderCustomer,
      reciverCustomer: reciverCustomer ?? this.reciverCustomer,
      vehicleDetail: vehicleDetail ?? this.vehicleDetail,
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
      acceptedAt: acceptedAt ?? this.acceptedAt,
      deleiveredAt: deleiveredAt ?? this.deleiveredAt,
    );
  }
}
