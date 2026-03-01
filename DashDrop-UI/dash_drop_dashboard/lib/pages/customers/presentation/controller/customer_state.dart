part of 'customer_bloc.dart';

class CustomerState extends Equatable {
  final List<Customer> getCustomers;
  final RequestState getCustomersState;
  final String getCustomersMessage;
  final RequestState deleteCustomerState;
  final String deleteCustomerMessage;

  const CustomerState({
    this.getCustomers = const [],
    this.getCustomersState = RequestState.loading,
    this.getCustomersMessage = '',
    this.deleteCustomerState = RequestState.loading,
    this.deleteCustomerMessage = '',
  });

  CustomerState copyWith({
    RequestState?  getCustomersState,
    List<Customer>? getCustomers,
    String? getCustomersMessage,
    RequestState? deleteCustomerState,
    String? deleteCustomerMessage,
  }) {
    return CustomerState(
      getCustomersState: getCustomersState ?? this.getCustomersState,
      getCustomers: getCustomers ?? this.getCustomers,
      getCustomersMessage: getCustomersMessage ?? this.getCustomersMessage,
      deleteCustomerState: deleteCustomerState ?? this.deleteCustomerState,
      deleteCustomerMessage: deleteCustomerMessage ?? this.deleteCustomerMessage,
    );
  }

  @override
  List<Object?> get props => [
        getCustomers,
        getCustomersState,
        getCustomersMessage,
        deleteCustomerState,
        deleteCustomerMessage
      ];
}
