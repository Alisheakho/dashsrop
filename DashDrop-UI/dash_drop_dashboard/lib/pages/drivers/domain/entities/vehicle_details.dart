import 'package:equatable/equatable.dart';

class VehicleDetails extends Equatable {
  final int id;
  final dynamic profitPerKm;
  final int avgSpeedKm;
  final int maxRangekm;
  final dynamic maxCapacityCubicM;
  final int maxWeightKg;
  final int sensitivityLevel;
  final int type;
  final String specifications;
  final String createdAt;
  final String lastUpdatedAt;

  const VehicleDetails(
      {required this.id,
      required this.profitPerKm,
      required this.avgSpeedKm,
      required this.maxRangekm,
      required this.maxCapacityCubicM,
      required this.maxWeightKg,
      required this.sensitivityLevel,
      required this.type,
      required this.specifications,
      required this.createdAt,
      required this.lastUpdatedAt});

  @override
  List<Object?> get props => [
    id,
    profitPerKm,
    avgSpeedKm,
    maxRangekm,
    maxCapacityCubicM,
    maxWeightKg,
    specifications,
    type,
    sensitivityLevel,
    createdAt,
    lastUpdatedAt
  ];
}

//  {
//     "id": 0,
//     "profitPerKm": 0,
//     "avgSpeedKm": 0,
//     "maxRangekm": 0,
//     "maxCapacityCubicM": 0,
//     "maxWeightKg": 0,
//     "specifications": "string",
//     "type": 0,
//     "sensitivityLevel": 0,
//     "createdAt": "2024-08-09T16:21:14.791Z",
//     "lastUpdatedAt": "2024-08-09T16:21:14.791Z"
//   }