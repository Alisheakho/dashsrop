import 'package:dash_drop_dashboard/pages/employees/domain/entities/employee.dart';
import 'package:equatable/equatable.dart';
import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';

import '../repository/base_employees_repository.dart';

class GetEmployeeUseCase extends BaseUseCase<void, GetEmployeeParameters> {
  GetEmployeeUseCase(this.employeesRepository);

  final BaseEmployeesRepository employeesRepository;

  @override
  ResultFuture<Employee> call(GetEmployeeParameters parameters) async =>
      employeesRepository.getEmployee(id: parameters.id);
}

class GetEmployeeParameters extends Equatable {
  const GetEmployeeParameters({required this.id});

  final int id;

  @override
  List<Object?> get props => [id];
}
