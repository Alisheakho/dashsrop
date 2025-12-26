import 'package:dash_drop_dashboard/pages/vehicle_details/domain/repository/base_vehicles_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';

class DeleteVehicleUseCase extends BaseUseCase<void, DeleteVehicleParameters> {
  DeleteVehicleUseCase(this.vehicleRepository);

  final BaseVehicleRepository vehicleRepository;

  @override
  ResultVoid call(DeleteVehicleParameters parameters) async =>
      await vehicleRepository.deleteVehicle(id: parameters.id);
}

class DeleteVehicleParameters extends Equatable {
  const DeleteVehicleParameters({required this.id});
  final int id;
  @override
  List<Object?> get props => [id];
}
