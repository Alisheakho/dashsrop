import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/domain/repository/base_vehicles_repository.dart';
import 'package:equatable/equatable.dart';

class UpdateVehicleUseCase extends BaseUseCase<void, UpdateVehicleParameters> {
  UpdateVehicleUseCase(this.vehicleRepository);

  final BaseVehicleRepository vehicleRepository;

  @override
  ResultFuture<void> call(UpdateVehicleParameters parameters) async {
    return await vehicleRepository.updateVehicle(
      id: parameters.id,
      avgSpeedKm: parameters.avgSpeedKm,
      costPerKm: parameters.costPerKm,
      maxCapacityCubicM: parameters.maxCapacityCubicM,
      maxRangekm: parameters.maxRangekm,
      maxWeightKg: parameters.maxWeightKg,
      sensitivityLevel: parameters.sensitivityLevel,
      specifications: parameters.specifications,
      type: parameters.type,
    );
  }
}

class UpdateVehicleParameters extends Equatable {
  final int id;
  final double costPerKm;
  final int avgSpeedKm;
  final int maxRangekm;
  final double maxCapacityCubicM;
  final int maxWeightKg;
  final SensitivityLevels sensitivityLevel;
  final VehicleTypes type;
  final String specifications;

  const UpdateVehicleParameters(
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
  List<Object> get props {
    return [
      id,
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
