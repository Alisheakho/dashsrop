import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/domain/entities/vehicle.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/domain/repository/base_vehicles_repository.dart';


class GetVehiclesUseCase extends BaseUseCase<List<Vehicle>, NoParameters> {
  GetVehiclesUseCase(this.vehicleRepository);

  final BaseVehicleRepository vehicleRepository;

  @override
  ResultFuture<List<Vehicle>> call(NoParameters parameters) async {
    return await vehicleRepository.getVehicles();
  }
}
