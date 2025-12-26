import 'package:dash_drop_dashboard/pages/customers/data/model/Customer_model.dart';
import 'package:dio/dio.dart';
import 'package:dash_drop_dashboard/core/error/exceptions.dart';
import 'package:dash_drop_dashboard/core/network/api_constances.dart';

import '../../../../core/network/error_message.dart';


abstract class BaseCustomerRemoteDataSource {


  Future<List<CustomerModel>> getCustomer();

  void delelteCustomer({required int id});
}

class CustomerRemoteDataSource extends BaseCustomerRemoteDataSource {
  @override
  Future<List<CustomerModel>> getCustomer() async {
    try {
      final response = await Dio().get(ApiConstances.customersUrl);
      // print(response);
      return List<CustomerModel>.from(
          (response.data as List).map((e) => CustomerModel.fromJson(e)));
    } on DioException catch (e) {
      if (401 == e.response?.statusCode || 403 == e.response?.statusCode ) {
        throw AuthException(
          statusCode: e.response?.statusCode,
          authMessage: e.response?.statusMessage
        );
      }
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
          statusCode: e.response?.statusCode);
    } catch (e) {
      // Handle any other exceptions
      print('Unexpected error: $e');
      throw Exception('Failed to get Customers: $e');
    }
  }

 

  @override
  void delelteCustomer({required int id}) async {
    String token = await ApiConstances.getToken();
    try {
      await Dio().delete(ApiConstances.customerUrl(id),
          options: Options(headers: ApiConstances.headers(token)));
    } on DioException catch (e) {
      if (401 == e.response?.statusCode || 403 == e.response?.statusCode ) {
        throw AuthException(
          statusCode: e.response?.statusCode,
          authMessage: e.response?.statusMessage
        );
      }
      ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
          statusCode: e.response?.statusCode);
    } catch (e) {
      // Handle any other exceptions
      print('Unexpected error: $e');
      throw Exception('Failed to Delete Customer: $e');
    }
  }
  
  
}
