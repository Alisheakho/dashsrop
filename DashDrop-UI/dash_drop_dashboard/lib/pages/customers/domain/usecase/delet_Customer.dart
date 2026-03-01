import 'package:dash_drop_dashboard/pages/customers/domain/repository/base_customer_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';



class DeleteCustomerUseCase
    extends BaseUseCase<void,DeleteCustomerParameters> {
 DeleteCustomerUseCase(this.CustomersRepository);

  final BaseCustomersRepository CustomersRepository;

  @override
  ResultVoid call(DeleteCustomerParameters parameters) async =>
       CustomersRepository.deleteCustomer(id: parameters.id);
}

class DeleteCustomerParameters extends Equatable {
  const DeleteCustomerParameters({required this.id});

  final int id;

  @override
  List<Object?> get props => [id];
}
