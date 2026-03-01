import 'package:equatable/equatable.dart';
import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';

import '../repository/base_drivers_repository.dart';

class DeleteDriverUseCase
    extends BaseUseCase<void, DeleteDriverParameters> {
  DeleteDriverUseCase(this.driversRepository);

  final BaseDriversRepository driversRepository;

  @override
  ResultVoid call(DeleteDriverParameters parameters) async =>
      driversRepository.deleteDrivers(id: parameters.id);
}

class DeleteDriverParameters extends Equatable {
  const DeleteDriverParameters({required this.id});

  final int id;

  @override
  List<Object?> get props => [id];
}
