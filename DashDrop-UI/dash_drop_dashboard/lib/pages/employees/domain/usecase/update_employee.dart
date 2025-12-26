import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';

import '../repository/base_employees_repository.dart';

class UpdateEmployeeUseCase
    extends BaseUseCase<void, UpdateEmployeeParameters> {
  UpdateEmployeeUseCase(this.employeesRepository);

  final BaseEmployeesRepository employeesRepository;

  @override
  ResultVoid call(UpdateEmployeeParameters parameters) async =>
      employeesRepository.updateEmployee(
        id: parameters.id,
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

class UpdateEmployeeParameters extends Equatable {
  const UpdateEmployeeParameters({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.title,
    required this.gender,
    required this.birthdate,
  });

  final int id;
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
        id,
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
