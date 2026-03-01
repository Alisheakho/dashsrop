import 'package:equatable/equatable.dart';
import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';

import '../repository/base_employees_repository.dart';

class DeleteEmployeeUseCase
    extends BaseUseCase<void, DeleteEmployeeParameters> {
  DeleteEmployeeUseCase(this.employeesRepository);

  final BaseEmployeesRepository employeesRepository;

  @override
  ResultVoid call(DeleteEmployeeParameters parameters) async =>
      employeesRepository.deleteEmployee(id: parameters.id);
}

class DeleteEmployeeParameters extends Equatable {
  const DeleteEmployeeParameters({required this.id});

  final int id;

  @override
  List<Object?> get props => [id];
}
