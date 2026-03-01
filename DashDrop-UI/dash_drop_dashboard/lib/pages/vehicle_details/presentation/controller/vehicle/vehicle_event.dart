part of 'vehicle_bloc.dart';

class VehicleEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetVehiclesEvent extends VehicleEvent {}

class GetVehicleEvent extends VehicleEvent {
  final int id;

  GetVehicleEvent({required this.id});

  @override
  List<Object?> get props => [id];

  @override
  String toString() => 'GetVehiclesEvent(id: $id)';
}

class DeleteVehicleEvent extends VehicleEvent {
  final int id;

  DeleteVehicleEvent({required this.id});

  @override
  List<Object?> get props => [id];

  @override
  String toString() => 'DeleteVehicleEvent(id: $id)';
}

class CreateVehicleEvent extends VehicleEvent {
  final double costPerKm;
  final int avgSpeedKm;
  final int maxRangekm;
  final double maxCapacityCubicM;
  final int maxWeightKg;
  final SensitivityLevels sensitivityLevel;
  final VehicleTypes type;
  final String specifications;

  CreateVehicleEvent(
      {required this.costPerKm,
      required this.avgSpeedKm,
      required this.maxRangekm,
      required this.maxCapacityCubicM,
      required this.maxWeightKg,
      required this.sensitivityLevel,
      required this.type,
      required this.specifications});

  @override
  List<Object?> get props => [
        costPerKm,
        avgSpeedKm,
        maxRangekm,
        maxCapacityCubicM,
        maxWeightKg,
        specifications,
        type,
        sensitivityLevel
      ];
}

class UpdateVehicleEvent extends VehicleEvent {
  final int id;
  final double costPerKm;
  final int avgSpeedKm;
  final int maxRangekm;
  final double maxCapacityCubicM;
  final int maxWeightKg;
  final SensitivityLevels sensitivityLevel;
  final VehicleTypes type;
  final String specifications;

  UpdateVehicleEvent(
      {required this.id,
      required this.costPerKm,
      required this.avgSpeedKm,
      required this.maxRangekm,
      required this.maxCapacityCubicM,
      required this.maxWeightKg,
      required this.sensitivityLevel,
      required this.type,
      required this.specifications});

  @override
  List<Object?> get props => [
        costPerKm,
        avgSpeedKm,
        maxRangekm,
        maxCapacityCubicM,
        maxWeightKg,
        specifications,
        type,
        sensitivityLevel
      ];
}
