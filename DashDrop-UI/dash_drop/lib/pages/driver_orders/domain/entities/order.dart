import 'package:equatable/equatable.dart';

class DriverBoxOrder extends Equatable {
  final int id;
  final double? extraProfitRate;
  final String?  estimatedTime;
  final int status;
  final int? paymentResponsibility;
  final String? polyLine;
  final double? pathLengthKm;
  final double? deliveryCost;
  final int? offersCount;
  final int? declinesCount;
  final String?  sourceLocation;
  final String?  sourceLocationDescription;
  final String?  destinationLocation;
  final String?  destinationLocationDescription;
  final String?  receivingCode;
  final Map<String, dynamic> senderCustomer;
  final Map<String, dynamic>? reciverCustomer;
  final Map<String, dynamic>? vehicleDetail;
  final String?  createdAt;
  final String?  lastUpdatedAt;
  final String? acceptedAt;
  final String?  deleiveredAt;

  const DriverBoxOrder({
   required this.id,
   required this.extraProfitRate,
   required this.estimatedTime,
   required this.status,
   required this.paymentResponsibility,
   required this.polyLine,
   required this.pathLengthKm,
   required this.deliveryCost,
   required this.offersCount,
   required this.declinesCount,
   required this.sourceLocation,
   required this.sourceLocationDescription,
   required this.destinationLocation,
   required this.destinationLocationDescription,
   required this.receivingCode,
   required this.senderCustomer,
   required this.reciverCustomer,
   required this.vehicleDetail,
   required this.createdAt,
   required this.lastUpdatedAt,
   required this.acceptedAt,
   required this.deleiveredAt,
  });

  @override
  List<Object?> get props {
    return [
      id,
      extraProfitRate,
      estimatedTime,
      status,
      paymentResponsibility,
      polyLine,
      pathLengthKm,
      deliveryCost,
      offersCount,
      declinesCount,
      sourceLocation,
      sourceLocationDescription,
      destinationLocation,
      destinationLocationDescription,
      receivingCode,
      senderCustomer,
      reciverCustomer,
      vehicleDetail,
      createdAt,
      lastUpdatedAt,
      acceptedAt,
      deleiveredAt,
    ];
  }
}
