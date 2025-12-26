// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/domain/entities/vehicle.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/domain/repository/base_vehicles_repository.dart';
import 'package:equatable/equatable.dart';

class CreateVehicleUseCase extends BaseUseCase<void, CreateVehicleParameters> {
  CreateVehicleUseCase(this.vehicleRepository);

  final BaseVehicleRepository vehicleRepository;

  @override
  ResultFuture<Vehicle> call(CreateVehicleParameters parameters) async {
    return await vehicleRepository.createVehicle(
        costPerKm: parameters.costPerKm,
        avgSpeedKm: parameters.avgSpeedKm,
        maxCapacityCubicM: parameters.maxCapacityCubicM,
        maxRangekm: parameters.maxRangekm,
        maxWeightKg: parameters.maxWeightKg,
        sensitivityLevel: parameters.sensitivityLevel,
        specifications: parameters.specifications,
        type: parameters.type);
  }
}

class CreateVehicleParameters extends Equatable {
  final double costPerKm;
  final int avgSpeedKm;
  final int maxRangekm;
  final double maxCapacityCubicM;
  final int maxWeightKg;
  final SensitivityLevels sensitivityLevel;
  final VehicleTypes type;
  final String specifications;

  const CreateVehicleParameters(
      {required this.costPerKm,
      required this.avgSpeedKm,
      required this.maxRangekm,
      required this.maxCapacityCubicM,
      required this.maxWeightKg,
      required this.sensitivityLevel,
      required this.type,
      required this.specifications});

  @override
  List<Object> get props {
    return [
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
}
