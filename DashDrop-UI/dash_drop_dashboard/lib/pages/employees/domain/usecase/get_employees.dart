import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';

import '../entities/employee.dart';
import '../repository/base_employees_repository.dart';

class GetEmployeesUseCase extends BaseUseCase<List<Employee>, NoParameters> {
  GetEmployeesUseCase(this.employeesRepository);

  final BaseEmployeesRepository employeesRepository;

  @override
  ResultFuture<List<Employee>> call(NoParameters parameters) async {
    return await employeesRepository.getEmployees();
  }
}
