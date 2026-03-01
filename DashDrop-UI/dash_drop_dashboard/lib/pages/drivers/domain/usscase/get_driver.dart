import 'package:dash_drop_dashboard/pages/drivers/domain/entities/drivers.dart';
import 'package:equatable/equatable.dart';
import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';

import '../repository/base_drivers_repository.dart';

class GetDriverUseCase extends BaseUseCase<void, GetDriverParameters> {
  GetDriverUseCase(this.driversRepository);

  final BaseDriversRepository driversRepository;

  @override
  ResultFuture<Drivers> call(GetDriverParameters parameters) async =>
    await driversRepository.getDriver(id: parameters.id);
}

class GetDriverParameters extends Equatable {
  const GetDriverParameters({required this.id});

  final int id;

  @override
  List<Object?> get props => [id];
}
