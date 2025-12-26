
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/customers/domain/entities/customer.dart';


abstract class BaseCustomersRepository {
  ResultFuture<List<Customer>> getCustomer();
  ResultVoid deleteCustomer({required int id});
}
