// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'employee_bloc.dart';

abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetEmployeesEvent extends EmployeeEvent {}

class GetEmployeeEvent extends EmployeeEvent {
  const GetEmployeeEvent({required this.id});

  final int id;

  @override
  List<Object?> get props => [id];

  @override
  String toString() => 'GetEmployeeEvent(id: $id)';
}

class CreateEmployeeEvent extends EmployeeEvent {
  const CreateEmployeeEvent({
    required this.firstName,
    required this.lastName,
    required this.userID,
    required this.password,
    required this.phoneNumber,
    required this.title,
    required this.gender,
    required this.birthdate,
  });

  final String firstName;
  final String lastName;
  final String userID;
  final String password;
  final String phoneNumber;
  final String title;
  final Gender gender;
  final String birthdate;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        userID,
        password,
        phoneNumber,
        title,
        gender,
        birthdate
      ];
}

class UpdateEmployeeEvent extends EmployeeEvent {
  const UpdateEmployeeEvent({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userID,
    required this.password,
    required this.phoneNumber,
    required this.title,
    required this.gender,
    required this.birthdate,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String userID;
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
        userID,
        password,
        phoneNumber,
        title,
        gender,
        birthdate
      ];
}

class DeleteEmployeeEvent extends EmployeeEvent {
  const DeleteEmployeeEvent({required this.id});

  final int id;

  @override
  List<Object?> get props => [id];
}
