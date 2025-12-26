import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/entities/vehicle_details.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/repository/base_drivers_repository.dart';


class GetVehicleDetailssUseCase extends BaseUseCase<List<VehicleDetails>, NoParameters> {
  GetVehicleDetailssUseCase(this.baseDriversRepository);

  final BaseDriversRepository baseDriversRepository;

  @override
  ResultFuture<List<VehicleDetails>> call(NoParameters parameters) async {
    return await baseDriversRepository.getVehicleDetails();
  }
}
