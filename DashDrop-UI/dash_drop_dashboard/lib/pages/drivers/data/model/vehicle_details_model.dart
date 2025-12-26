import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/entities/vehicle_details.dart';

class VehicleDetailsModel extends VehicleDetails {
  const VehicleDetailsModel(
      {required super.id,
      required super.profitPerKm,
      required super.avgSpeedKm,
      required super.maxRangekm,
      required super.maxCapacityCubicM,
      required super.maxWeightKg,
      required super.sensitivityLevel,
      required super.type,
      required super.specifications,
      required super.createdAt,
      required super.lastUpdatedAt});

  factory VehicleDetailsModel.fromJson(DataMap map) {
    return VehicleDetailsModel(
      id: map['id'] as int,
      profitPerKm: map['profitPerKm'] as dynamic,
      avgSpeedKm: map['avgSpeedKm'] as int,
      maxRangekm: map['maxRangekm'] as int,
      maxCapacityCubicM: map['maxCapacityCubicM'] as dynamic,
      maxWeightKg: map['maxWeightKg'] as int,
      sensitivityLevel: map['sensitivityLevel'] as int,
      createdAt: map['createdAt'] as String,
      lastUpdatedAt: map['lastUpdatedAt'] as String,
      type: map['type'] as int,
      specifications: map['specifications'] as String,
    );
  }
}
