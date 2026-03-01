import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/entities/regions.dart';

import '../repository/base_drivers_repository.dart';

class GetRegionsUseCase extends BaseUseCase<List<Regions>, NoParameters> {
  GetRegionsUseCase(this.driversRepository);

  final BaseDriversRepository driversRepository;

  @override
  ResultFuture<List<Regions>> call(NoParameters parameters) async {
    return await driversRepository.getRegions();
  }
}
