import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/pages/customers/domain/entities/customer.dart';
import 'package:dash_drop_dashboard/pages/customers/domain/usecase/delet_Customer.dart';
import 'package:dash_drop_dashboard/pages/customers/domain/usecase/get_Customers.dart';
import 'package:equatable/equatable.dart';
part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
    final GetCustomersUseCase getCustomersUseCase;
   final DeleteCustomerUseCase deleteCustomerUseCase;
  CustomerBloc(
      this.getCustomersUseCase,
      this.deleteCustomerUseCase,
  ) : super(const CustomerState()) {
    on<GetCustomersEvent>(_getCustomersHandler);
    on<DeleteCustomerEvent>(_deleteCustomerHandler);
  }
   FutureOr<void> _getCustomersHandler(
      GetCustomersEvent event, Emitter<CustomerState> emit) async {
    final result = await getCustomersUseCase(const NoParameters());
    // print(result);
    // emit(const EmployeesState(getEmployeesState: RequestState.loaded));
    result.fold(
        (l) => emit(state.copyWith(
            getCustomersMessage: l.message,
            getCustomersState: RequestState.error)),
        (r) => emit(state.copyWith(
            getCustomers: r, getCustomersState: RequestState.loaded)));
  }
FutureOr<void> _deleteCustomerHandler(
      DeleteCustomerEvent event, Emitter<CustomerState> emit) async {
    final result =
        await deleteCustomerUseCase(DeleteCustomerParameters(id: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            deleteCustomerMessage: l.message,
            deleteCustomerState: RequestState.error)),
        (_) => emit(state.copyWith(
            deleteCustomerState: RequestState.loaded,
            getCustomers: state.getCustomers
                .where((employee) => employee.id != event.id)
                .toList())));
  }
}


