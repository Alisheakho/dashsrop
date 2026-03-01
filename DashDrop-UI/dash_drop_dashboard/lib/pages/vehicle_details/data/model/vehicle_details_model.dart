import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/domain/entities/vehicle.dart';
class VehicleModel extends Vehicle{
  const VehicleModel(
      {required super.id,
      required super.costPerKm,
      required super.avgSpeedKm,
      required super.maxRangekm,
      required super.maxCapacityCubicM,
      required super.maxWeightKg,
      required super.sensitivityLevel,
      required super.type,
      required super.specifications,
      required super.createdAt,
      required super.lastUpdatedAt});

  factory VehicleModel.fromJson(DataMap map) {
    return VehicleModel(
      id: map['id'] as int,
      costPerKm: map['costPerKm'].toDouble() as double,
      avgSpeedKm: map['avgSpeedKm'] as int,
      maxRangekm: map['maxRangekm'] as int,
      maxCapacityCubicM: map['maxCapacityCubicM'].toDouble() as double,
      maxWeightKg: map['maxWeightKg'] as int,
      sensitivityLevel: SensitivityLevels.values[map['sensitivityLevel']],
      createdAt: map['createdAt'] as String,
      lastUpdatedAt: map['lastUpdatedAt'] as String,
      type: VehicleTypes.values[map['type']],
      specifications: map['specifications'] as String,
    );
  }
}
