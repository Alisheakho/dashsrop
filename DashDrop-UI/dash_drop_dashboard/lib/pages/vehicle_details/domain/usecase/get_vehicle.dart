import 'package:dash_drop_dashboard/pages/vehicle_details/domain/entities/vehicle.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/domain/repository/base_vehicles_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';

class GetVehicleUseCase extends BaseUseCase<void, GetVehicleParameters> {
  GetVehicleUseCase(this.vehicleRepository);
  final BaseVehicleRepository vehicleRepository;

  @override
  ResultFuture<Vehicle> call(GetVehicleParameters parameters) async =>
     await vehicleRepository.getVehicle(id: parameters.id);
}

class GetVehicleParameters extends Equatable {
  const GetVehicleParameters({required this.id});
  final int id;
  @override
  List<Object?> get props => [id];
}
