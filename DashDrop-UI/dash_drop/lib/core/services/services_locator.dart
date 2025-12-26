import 'package:dash_drop/driver/pages/order/domain/repository/base_order_repository.dart';
import 'package:dash_drop/driver/pages/order/domain/usecase/get_order.dart';
import 'package:dash_drop/driver/pages/order/presentation/controller/reder_controller.dart';
import 'package:dash_drop/pages/order/data/data_source/order_remote_data_source.dart';
import 'package:dash_drop/pages/order/data/repository/order_repository.dart';
import 'package:dash_drop/pages/order/domain/repository/base_order_repository.dart';
import 'package:dash_drop/pages/order/domain/usecase/get_order.dart';
import 'package:dash_drop/pages/order/presentation/controller/reder_controller.dart';

import 'package:dash_drop/pages/receive_order/data/data_source/receive_order_remote_data_source.dart';
import 'package:dash_drop/pages/receive_order/data/repository/auth_repository.dart';
import 'package:dash_drop/pages/receive_order/domain/repository/base_auth_repository.dart';
import 'package:dash_drop/pages/receive_order/domain/usecase/calc_cost.dart';
import 'package:dash_drop/pages/receive_order/domain/usecase/confirm_order.dart';
import 'package:dash_drop/pages/receive_order/domain/usecase/get_polyline.dart';
import 'package:dash_drop/pages/receive_order/domain/usecase/sender_location.dart';
import 'package:dash_drop/pages/receive_order/presentation/controller/receive_order_controller.dart';
import 'package:dash_drop/pages/send_order/data/data_source/send_order_remote_data_source.dart';
import 'package:dash_drop/pages/send_order/data/repository/send_order_repository.dart';
import 'package:dash_drop/pages/send_order/domain/repository/base_send_order_repository.dart';
import 'package:dash_drop/pages/send_order/domain/usecase/create_order.dart';
import 'package:dash_drop/pages/send_order/presentation/controller/send_order_controller.dart';
import 'package:get_it/get_it.dart';

import '../../driver/pages/order/data/data_source/order_remote_data_source.dart';
import '../../driver/pages/order/data/repository/order_repository.dart';
import '../../pages/authentication/data/data_source/auth_local_data_source.dart';
import '../../pages/authentication/data/data_source/auth_remote_data_source.dart';
import '../../pages/authentication/data/repository/auth_repository.dart';
import '../../pages/authentication/domain/repository/base_auth_repository.dart';
import '../../pages/authentication/domain/usecase/get_user.dart';
import '../../pages/authentication/domain/usecase/is_authorized.dart';
import '../../pages/authentication/domain/usecase/login.dart';
import '../../pages/authentication/domain/usecase/register.dart';
import '../../pages/authentication/domain/usecase/logout.dart';
import '../../pages/authentication/presentation/controller/auth_controller.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    _authSL();
    _receiveOerderSL();
    _sendOerderSL();
    _order();
    _orderDriver();
  }

  void _authSL() {
    /// Bloc
    sl.registerLazySingleton(
        () => AuthController(sl(), sl(), sl(), sl(), sl()));

    /// USE CACES
    sl.registerLazySingleton(() => GetUserUseCase(sl()));
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => RegisterUseCase(sl()));
    sl.registerLazySingleton(() => IsAuthorizedUseCase(sl()));
    sl.registerLazySingleton(() => LogoutUseCase(sl()));

    /// REPOSESITORY
    sl.registerLazySingleton<BaseAuthRepository>(
        () => AuthRepository(sl(), sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseUserLocalDataSource>(
        () => UserLocalDataSource(sl()));
    sl.registerLazySingleton<BaseUserRemoteDataSource>(
        () => UserRemoteDataSource());
  }

  void _order() {
    /// Bloc
    sl.registerLazySingleton(() => OrderController(sl()));

    /// USE CACES
    sl.registerLazySingleton(() => GetOrderUseCase(sl()));

    /// REPOSESITORY
    sl.registerLazySingleton<BaseOrdersRepository>(() => OrderRepository(sl()));

    /// DATA SOURCE

    sl.registerLazySingleton<BaseOrderRemoteDataSource>(
        () => OrderRemoteDataSource());

    // // Register dependencies with Get.put
    // Get.put<BaseOrderRemoteDataSource>(OrderRemoteDataSource());
    // Get.put<BaseOrdersRepository>(OrderRepository(Get.find<BaseOrderRemoteDataSource>()));
    // Get.put<GetOrderUseCase>(GetOrderUseCase(Get.find<BaseOrdersRepository>()));
    // Get.put<OrderController>(OrderController(Get.find<GetOrderUseCase>()));
  }

  void _orderDriver() {
    /// Bloc
    sl.registerLazySingleton(() => OrderDriverController(sl()));

    /// USE CACES
    sl.registerLazySingleton(() => GetOrderDriverUseCase(sl()));

    /// REPOSESITORY
    sl.registerLazySingleton<BaseOrdersDriverRepository>(
        () => OrderDriverRepository(sl()));

    /// DATA SOURCE

    sl.registerLazySingleton<BaseOrderDriverRemoteDataSource>(
        () => OrderDriverRemoteDataSource());

    // // Register dependencies with Get.put
    // Get.put<BaseOrderRemoteDataSource>(OrderRemoteDataSource());
    // Get.put<BaseOrdersRepository>(OrderRepository(Get.find<BaseOrderRemoteDataSource>()));
    // Get.put<GetOrderUseCase>(GetOrderUseCase(Get.find<BaseOrdersRepository>()));
    // Get.put<OrderController>(OrderController(Get.find<GetOrderUseCase>()));
  }

  void _receiveOerderSL() {
    /// Bloc
    sl.registerLazySingleton(
        () => ReceiveOrderController(sl(), sl(), sl(), sl()));

    /// USE CACES
    sl.registerLazySingleton(() => SenderLocationUseCase(sl()));
    sl.registerLazySingleton(() => GetPolylineUseCase(sl()));
    sl.registerLazySingleton(() => CalcCostUseCase(sl()));
    sl.registerLazySingleton(() => ConfirmOrderUseCase(sl()));

    /// REPOSESITORY
    sl.registerLazySingleton<BaseReceiveOrderRepository>(
        () => ReceiveOrderRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseReceiveOrderRemoteDataSource>(
        () => ReceiveOrderRemoteDataSource());
  }

  void _sendOerderSL() {
    /// Bloc
    sl.registerLazySingleton(() => SendOrderController(sl()));

    /// USE CACES
    sl.registerLazySingleton(() => CreateOrderUseCase(sl()));

    /// REPOSESITORY
    sl.registerLazySingleton<BaseSendOrderRepository>(
        () => SendOrderRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseSendOrderRemoteDataSource>(
        () => SendOrderRemoteDataSource());
  }
}
