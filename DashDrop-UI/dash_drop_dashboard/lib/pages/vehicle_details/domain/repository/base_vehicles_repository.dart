import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/domain/entities/vehicle.dart';

abstract class BaseVehicleRepository {
  ResultFuture<List<Vehicle>> getVehicles();

  ResultFuture<Vehicle> getVehicle({required int id});

  ResultFuture<Vehicle> createVehicle(
      {required double costPerKm,
      required int avgSpeedKm,
      required int maxRangekm,
      required double maxCapacityCubicM,
      required int maxWeightKg,
      required SensitivityLevels sensitivityLevel,
      required VehicleTypes type,
      required String specifications
      });

  ResultVoid updateVehicle(
       {
      required int id,
      required double costPerKm,
      required int avgSpeedKm,
      required int maxRangekm,
      required double maxCapacityCubicM,
      required int maxWeightKg,
      required SensitivityLevels sensitivityLevel,
      required VehicleTypes type,
      required String specifications
      });

  ResultVoid deleteVehicle({required int id});

}
