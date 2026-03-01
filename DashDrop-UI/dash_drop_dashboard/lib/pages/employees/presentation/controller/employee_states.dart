// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'employee_bloc.dart';

class EmployeeState extends Equatable {
  final List<Employee> getEmployees;
  final RequestState getEmployeesState;
  final String getEmployeesMessage;

  final Employee getEmployee;
  final RequestState getEmployeeState;
  final String getEmployeeMessage;

  final RequestState createEmployeeState;
  final String createEmployeeMessage;
  final Map? createEmployeeErrors;

  final RequestState updateEmployeeState;
  final String updateEmployeeMessage;
  final Map? updateEmployeeErrors;

  final RequestState deleteEmployeeState;
  final String deleteEmployeeMessage;

  const EmployeeState({
    this.getEmployees = const [],
    this.getEmployeesState = RequestState.loading,
    this.getEmployeesMessage = '',
    this.getEmployee = const Employee(
        id: 0,
        firstName: '',
        lastName: '',
        userID: '',
        phoneNumber: '',
        title: '',
        gender: Gender.male,
        birthdate: '',
        createdAt: '',
        lastUpdatedAt: ''),
    this.getEmployeeState = RequestState.loading,
    this.getEmployeeMessage = '',
    this.createEmployeeState = RequestState.loading,
    this.createEmployeeMessage = '',
    this.createEmployeeErrors,
    this.updateEmployeeState = RequestState.loading,
    this.updateEmployeeMessage = '',
    this.updateEmployeeErrors,
    this.deleteEmployeeState = RequestState.loading,
    this.deleteEmployeeMessage = '',
  });

  @override
  List<Object> get props {
    return [
      getEmployees,
      getEmployeesState,
      getEmployeesMessage,
      getEmployee,
      getEmployeeState,
      getEmployeeMessage,
      createEmployeeState,
      createEmployeeMessage,
      updateEmployeeState,
      updateEmployeeMessage,
      deleteEmployeeState,
      deleteEmployeeMessage,
    ];
  }

  EmployeeState copyWith({
    List<Employee>? getEmployees,
    RequestState? getEmployeesState,
    String? getEmployeesMessage,
    Employee? getEmployee,
    RequestState? getEmployeeState,
    String? getEmployeeMessage,
    RequestState? createEmployeeState,
    String? createEmployeeMessage,
    Map? createEmployeeErrors,
    RequestState? updateEmployeeState,
    String? updateEmployeeMessage,
    Map? updateEmployeeErrors,
    RequestState? deleteEmployeeState,
    String? deleteEmployeeMessage,
  }) {
    return EmployeeState(
      getEmployees: getEmployees ?? this.getEmployees,
      getEmployeesState: getEmployeesState ?? this.getEmployeesState,
      getEmployeesMessage: getEmployeesMessage ?? this.getEmployeesMessage,
      getEmployee: getEmployee ?? this.getEmployee,
      getEmployeeState: getEmployeeState ?? this.getEmployeeState,
      getEmployeeMessage: getEmployeeMessage ?? this.getEmployeeMessage,
      createEmployeeState: createEmployeeState ?? this.createEmployeeState,
      createEmployeeMessage:
          createEmployeeMessage ?? this.createEmployeeMessage,
      createEmployeeErrors: createEmployeeErrors ?? this.createEmployeeErrors,
      updateEmployeeState: updateEmployeeState ?? this.updateEmployeeState,
      updateEmployeeMessage:
          updateEmployeeMessage ?? this.updateEmployeeMessage,
      updateEmployeeErrors: updateEmployeeErrors ?? this.updateEmployeeErrors,
      deleteEmployeeState: deleteEmployeeState ?? this.deleteEmployeeState,
      deleteEmployeeMessage:
          deleteEmployeeMessage ?? this.deleteEmployeeMessage,
    );
  }
}
