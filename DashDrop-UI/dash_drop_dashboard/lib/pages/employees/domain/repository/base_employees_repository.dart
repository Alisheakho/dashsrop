import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/employees/domain/entities/employee.dart';

abstract class BaseEmployeesRepository {
  ResultFuture<List<Employee>> getEmployees();

  ResultFuture<Employee> getEmployee({required int id});

  ResultFuture<Employee> createEmployee(
      {required String firstName,
      required String lastName,
      required String userID,
      required String password,
      required String phoneNumber,
      required String title,
      required Gender gender,
      required String birthdate});

  ResultVoid updateEmployee(
      {required int id,
      required String firstName,
      required String lastName,
      required String userID,
      required String password,
      required String phoneNumber,
      required String title,
      required Gender gender,
      required String birthdate});

  ResultVoid deleteEmployee({required int id});
}
