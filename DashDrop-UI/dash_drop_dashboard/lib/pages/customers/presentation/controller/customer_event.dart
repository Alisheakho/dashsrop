part of 'customer_bloc.dart';


abstract class CustomerEvent extends Equatable {
  const CustomerEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetCustomersEvent extends CustomerEvent {}

class DeleteCustomerEvent extends CustomerEvent  {
  final int id;
 const  DeleteCustomerEvent( { required this.id});
   @override
  List<Object?> get props => [id];
}
