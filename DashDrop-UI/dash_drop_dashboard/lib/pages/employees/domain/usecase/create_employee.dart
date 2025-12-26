import 'package:dash_drop_dashboard/pages/employees/domain/entities/employee.dart';
import 'package:equatable/equatable.dart';
import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';

import '../../../../core/utils/enums.dart';
import '../repository/base_employees_repository.dart';

class CreateEmployeeUseCase
    extends BaseUseCase<void, CreateEmployeeParameters> {
  CreateEmployeeUseCase(this.employeesRepository);

  final BaseEmployeesRepository employeesRepository;

  @override
  ResultFuture<Employee> call(CreateEmployeeParameters parameters) async =>
      employeesRepository.createEmployee(
        firstName: parameters.firstName,
        lastName: parameters.lastName,
        email: parameters.email,
        password: parameters.password,
        phoneNumber: parameters.phoneNumber,
        title: parameters.title,
        gender: parameters.gender,
        birthdate: parameters.birthdate,
      );
}

class CreateEmployeeParameters extends Equatable {
  const CreateEmployeeParameters({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.title,
    required this.gender,
    required this.birthdate,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phoneNumber;
  final String title;
  final Gender gender;
  final String birthdate;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        password,
        phoneNumber,
        title,
        gender,
        birthdate
      ];
}
