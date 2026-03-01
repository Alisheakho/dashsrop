import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/customers/domain/entities/customer.dart';
import 'package:dash_drop_dashboard/pages/customers/domain/repository/base_customer_repository.dart';



class GetCustomersUseCase extends BaseUseCase<List<Customer>, NoParameters> {
  GetCustomersUseCase(this.CustomersRepository);

  final BaseCustomersRepository CustomersRepository;

  @override
  ResultFuture<List<Customer>> call(NoParameters parameters) async {
    return await CustomersRepository.getCustomer();
  }
}
