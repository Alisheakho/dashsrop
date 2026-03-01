import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/entities/drivers.dart';

import '../repository/base_drivers_repository.dart';

class GetDriversUseCase extends BaseUseCase<List<Drivers>, NoParameters> {
  GetDriversUseCase(this.driversRepository);

  final BaseDriversRepository driversRepository;

  @override
  ResultFuture<List<Drivers>> call(NoParameters parameters) async {
    return await driversRepository.getDrivers();
  }
}
