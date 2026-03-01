import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';

import '../../domain/entities/employee.dart';
import '../../domain/usecase/create_employee.dart';
import '../../domain/usecase/delete_employee.dart';
import '../../domain/usecase/get_employee.dart';
import '../../domain/usecase/get_employees.dart';
import '../../domain/usecase/update_employee.dart';

part 'employee_events.dart';
part 'employee_states.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final GetEmployeesUseCase getEmployeesUseCase;
  final GetEmployeeUseCase getEmployeeUseCase;
  final CreateEmployeeUseCase createEmployeeUseCase;
  final UpdateEmployeeUseCase updateEmployeeUseCase;
  final DeleteEmployeeUseCase deleteEmployeeUseCase;

  EmployeeBloc(
      this.getEmployeesUseCase,
      this.getEmployeeUseCase,
      this.createEmployeeUseCase,
      this.updateEmployeeUseCase,
      this.deleteEmployeeUseCase)
      : super(const EmployeeState()) {
    on<GetEmployeesEvent>(_getEmployeesHandler);
    on<GetEmployeeEvent>(_getEmployeeHandler);
    on<CreateEmployeeEvent>(_createEmployeeHandler);
    on<UpdateEmployeeEvent>(_updateEmployeeHandler);
    on<DeleteEmployeeEvent>(_deleteEmployeeHandler);
  }

  FutureOr<void> _getEmployeesHandler(
      GetEmployeesEvent event, Emitter<EmployeeState> emit) async {
    final result = await getEmployeesUseCase(const NoParameters());
    // print(result);
    // emit(const EmployeesState(getEmployeesState: RequestState.loaded));
    result.fold(
        (l) => emit(state.copyWith(
            getEmployeesMessage: l.message,
            getEmployeesState: RequestState.error)),
        (r) => emit(state.copyWith(
            getEmployees: r, getEmployeesState: RequestState.loaded)));
  }

  FutureOr<void> _getEmployeeHandler(
      GetEmployeeEvent event, Emitter<EmployeeState> emit) async {
    final result =
        await getEmployeeUseCase(GetEmployeeParameters(id: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            getEmployeeMessage: l.message,
            getEmployeeState: RequestState.error)),
        (r) => emit(state.copyWith(
            getEmployee: r,
            getEmployeeState: RequestState.loaded))); //createEmployee: r,
  }

  FutureOr<void> _createEmployeeHandler(
      CreateEmployeeEvent event, Emitter<EmployeeState> emit) async {
    final result = await createEmployeeUseCase(CreateEmployeeParameters(
        firstName: event.firstName,
        lastName: event.lastName,
        userID: event.userID,
        password: event.password,
        phoneNumber: event.phoneNumber,
        title: event.title,
        gender: event.gender,
        birthdate: event.birthdate));
    result.fold(
        (l) => emit(state.copyWith(
            createEmployeeMessage: l.message,
            createEmployeeErrors: l.errors,
            createEmployeeState: RequestState.error)), (r) {
      List<Employee> employees = state.getEmployees;
      employees.add(r);
      emit(state.copyWith(
          createEmployeeState: RequestState.loaded, getEmployees: employees));
    });
  }

  FutureOr<void> _updateEmployeeHandler(
      UpdateEmployeeEvent event, Emitter<EmployeeState> emit) async {
    final result = await updateEmployeeUseCase(UpdateEmployeeParameters(
        id: event.id,
        firstName: event.firstName,
        lastName: event.lastName,
        userID: event.userID,
        password: event.password,
        phoneNumber: event.phoneNumber,
        title: event.title,
        gender: event.gender,
        birthdate: event.birthdate));
    result.fold(
        (l) => emit(state.copyWith(
            updateEmployeeMessage: l.message,
            updateEmployeeErrors: l.errors,
            updateEmployeeState: RequestState.error)), (_) {
      List<Employee> updatedEmployees = state.getEmployees.map((employee) {
        if (employee.id == event.id) {
          return employee.copyWith(
            firstName: event.firstName,
            lastName: event.lastName,
            userID: event.userID,
            phoneNumber: event.phoneNumber,
            title: event.title,
            gender: event.gender,
            birthdate: event.birthdate,
          );
        }
        return employee; // Return unchanged employees
      }).toList();
      emit(state.copyWith(
          updateEmployeeState: RequestState.loaded,
          getEmployees: updatedEmployees));
    });
  }

  FutureOr<void> _deleteEmployeeHandler(
      DeleteEmployeeEvent event, Emitter<EmployeeState> emit) async {
    final result =
        await deleteEmployeeUseCase(DeleteEmployeeParameters(id: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            deleteEmployeeMessage: l.message,
            deleteEmployeeState: RequestState.error)),
        (_) => emit(state.copyWith(
            deleteEmployeeState: RequestState.loaded,
            getEmployees: state.getEmployees
                .where((employee) => employee.id != event.id)
                .toList())));
  }
}
