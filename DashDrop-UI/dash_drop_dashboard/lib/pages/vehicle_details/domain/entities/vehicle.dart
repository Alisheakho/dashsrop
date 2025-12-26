import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

class Vehicle extends Equatable {
  final int id;
  final double costPerKm;
  final int avgSpeedKm;
  final int maxRangekm;
  final double maxCapacityCubicM;
  final int maxWeightKg;
  final SensitivityLevels sensitivityLevel;
  final VehicleTypes type;
  final String specifications;
  final String createdAt;
  final String lastUpdatedAt;

  const Vehicle(
      {required this.id,
      required this.costPerKm,
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
        costPerKm,
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

  Vehicle copyWith({
    int? id,
    double? costPerKm,
    int? avgSpeedKm,
    int? maxRangekm,
    double? maxCapacityCubicM,
    int? maxWeightKg,
    SensitivityLevels? sensitivityLevel,
    VehicleTypes? type,
    String? specifications,
    String? createdAt,
    String? lastUpdatedAt,
  }) {
    return Vehicle(
        id: id ?? this.id,
        costPerKm: costPerKm ?? this.costPerKm,
        avgSpeedKm: avgSpeedKm ?? this.avgSpeedKm,
        maxRangekm: maxRangekm ?? this.maxRangekm,
        maxCapacityCubicM: maxCapacityCubicM ?? this.maxCapacityCubicM,
        maxWeightKg: maxWeightKg ?? this.maxWeightKg,
        sensitivityLevel: sensitivityLevel ?? this.sensitivityLevel,
        type: type ?? this.type,
        specifications: specifications ?? this.specifications,
        createdAt: createdAt ?? this.createdAt,
        lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt);
  }
}
