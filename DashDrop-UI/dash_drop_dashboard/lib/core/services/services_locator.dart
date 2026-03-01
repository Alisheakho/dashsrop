import 'package:dash_drop_dashboard/pages/drivers/data/data_source/driver_remote_data_source.dart';
import 'package:dash_drop_dashboard/pages/drivers/data/repository/driver_repository.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/repository/base_drivers_repository.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/usscase/create_driver.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/usscase/delete_driver.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/usscase/get_Regions.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/usscase/get_driver.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/usscase/get_drivers.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/usscase/get_vehicleDetails.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/usscase/update_driver.dart';
import 'package:dash_drop_dashboard/pages/drivers/presentation/controller/driver/driver_bloc.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/data/data_source/hiering_remote_data_source.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/data/repository/giering_repository.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/domain/repository/base_hiering_repository.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/domain/usscase/create_hiering.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/domain/usscase/delete_hiering.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/domain/usscase/get_hiering.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/domain/usscase/get_hierings.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/domain/usscase/update_hiering.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/presentation/controller/hiering/hiering_bloc.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/data/data_source/vehicle_remote_data_source.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/data/repository/vehicle_repository.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/domain/repository/base_vehicles_repository.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/domain/usecase/create_vehicle.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/domain/usecase/delete_vehicle.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/domain/usecase/get_vehicle.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/domain/usecase/get_vehicles.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/domain/usecase/update_vehicle.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/presentation/controller/vehicle/vehicle_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:dash_drop_dashboard/pages/customers/data/data_source/customer_remote_data_source.dart';
import 'package:dash_drop_dashboard/pages/customers/data/repository/customer_repository.dart';
import 'package:dash_drop_dashboard/pages/customers/domain/repository/base_customer_repository.dart';
import 'package:dash_drop_dashboard/pages/customers/domain/usecase/delet_Customer.dart';
import 'package:dash_drop_dashboard/pages/customers/domain/usecase/get_Customers.dart';
import 'package:dash_drop_dashboard/pages/customers/presentation/controller/customer_bloc.dart';
import 'package:dash_drop_dashboard/pages/employees/presentation/controller/employee_bloc.dart';

import '../../pages/auth/data/data_source/user_local_data_source.dart';
import '../../pages/auth/data/data_source/user_remote_data_source.dart';
import '../../pages/auth/data/repository/auth_repository.dart';
import '../../pages/auth/domain/repository/base_auth_repository.dart';
import '../../pages/auth/domain/usecase/get_user.dart';
import '../../pages/auth/domain/usecase/is_authorized.dart';
import '../../pages/auth/domain/usecase/login.dart';
import '../../pages/auth/domain/usecase/reset_password.dart';
import '../../pages/auth/presentation/controller/auth_bloc.dart';
import '../../pages/auth/domain/usecase/logout.dart';

import '../../pages/employees/data/data_source/employee_remote_data_source.dart';
import '../../pages/employees/data/repository/auth_repository.dart';
import '../../pages/employees/domain/repository/base_employees_repository.dart';
import '../../pages/employees/domain/usecase/create_employee.dart';
import '../../pages/employees/domain/usecase/delete_employee.dart';
import '../../pages/employees/domain/usecase/get_employee.dart';
import '../../pages/employees/domain/usecase/get_employees.dart';
import '../../pages/employees/domain/usecase/update_employee.dart';

import '../../pages/job_offers/data/data_source/job_offer_remote_data_source.dart';
import '../../pages/job_offers/data/repository/auth_repository.dart';
import '../../pages/job_offers/domain/repository/base_job_offers_repository.dart';
import '../../pages/job_offers/domain/usecase/create_job_offer.dart';
import '../../pages/job_offers/domain/usecase/delete_job_offer.dart';
import '../../pages/job_offers/domain/usecase/get_job_offer.dart';
import '../../pages/job_offers/domain/usecase/get_job_offers.dart';
import '../../pages/job_offers/domain/usecase/update_job_offer.dart';
import '../../pages/job_offers/presentation/controller/job_offer_bloc.dart';
import '../../pages/branches/data/data_source/branch_remote_data_source.dart';
import '../../pages/branches/data/repositories/branches_repository.dart';
import '../../pages/branches/domain/repositories/base_branches_repository.dart';
import '../../pages/branches/presentation/controller/branch_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  /// Here you add your void function for services locator
  void init() {
    _employeeSL();
    _authSL();
    _customerSL();
    _jobOfferSL();
    _driverSL();
    _vehicleSl();
    _hieringRequestsSl();
    _branchesSl();
  }

  void _branchesSl() {
    sl.registerFactory(() => BranchBloc(sl()));

    sl.registerLazySingleton<BaseBranchesRepository>(
        () => BranchesRepository(sl()));

    sl.registerLazySingleton<BaseBranchesRemoteDataSource>(
        () => BranchesRemoteDataSource());
  }

  void _employeeSL() {
    /// Bloc
    sl.registerLazySingleton(() => EmployeeBloc(sl(), sl(), sl(), sl(), sl()));

    /// USE CACES
    sl.registerLazySingleton(() => GetEmployeesUseCase(sl()));
    sl.registerLazySingleton(() => GetEmployeeUseCase(sl()));
    sl.registerLazySingleton(() => CreateEmployeeUseCase(sl()));
    sl.registerLazySingleton(() => UpdateEmployeeUseCase(sl()));
    sl.registerLazySingleton(() => DeleteEmployeeUseCase(sl()));

    /// REPOSESITORY
    sl.registerLazySingleton<BaseEmployeesRepository>(
        () => EmployeesRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseEmployeeRemoteDataSource>(
        () => EmployeeRemoteDataSource());
  }

  void _authSL() {
    /// Bloc
    sl.registerLazySingleton(() => AuthBloc(sl(), sl(), sl(), sl(), sl()));

    /// USE CACES
    sl.registerLazySingleton(() => GetUserUseCase(sl()));
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));
    sl.registerLazySingleton(() => IsAuthorizedUseCase(sl()));
    sl.registerLazySingleton(() => LogoutUseCase(sl()));

    /// REPOSESITORY
    sl.registerLazySingleton<BaseAuthRepository>(
        () => AuthRepository(sl(), sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseUserLocalDataSource>(
        () => UserLocalDataSource(baseUserRemoteDataSource: sl()));
    sl.registerLazySingleton<BaseUserRemoteDataSource>(
        () => UserRemoteDataSource());
  }

  void _customerSL() {
    /// Bloc
    sl.registerLazySingleton(() => CustomerBloc(sl(), sl()));

    /// USE CACES
    sl.registerLazySingleton(() => GetCustomersUseCase(sl()));
    sl.registerLazySingleton(() => DeleteCustomerUseCase(sl()));

    /// REPOSESITORY
    sl.registerLazySingleton<BaseCustomersRepository>(
        () => CustomersRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseCustomerRemoteDataSource>(
        () => CustomerRemoteDataSource());
  }

  void _jobOfferSL() {
    /// Bloc
    sl.registerLazySingleton(() => JobOfferBloc(sl(), sl(), sl(), sl(), sl()));

    /// USE CACES
    sl.registerLazySingleton(() => GetJobOffersUseCase(sl()));
    sl.registerLazySingleton(() => GetJobOfferUseCase(sl()));
    sl.registerLazySingleton(() => CreateJobOfferUseCase(sl()));
    sl.registerLazySingleton(() => UpdateJobOfferUseCase(sl()));
    sl.registerLazySingleton(() => DeleteJobOfferUseCase(sl()));

    /// REPOSESITORY
    sl.registerLazySingleton<BaseJobOffersRepository>(
        () => JobOffersRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseJobOfferRemoteDataSource>(
        () => JobOfferRemoteDataSource());
  }

  void _driverSL() {
    ///bloc
    sl.registerLazySingleton(
        () => DriverBloc(sl(), sl(), sl(), sl(), sl(), sl(), sl()));

    ///use case
    sl.registerLazySingleton(() => GetDriverUseCase(sl()));
    sl.registerLazySingleton(() => GetDriversUseCase(sl()));
    sl.registerLazySingleton(() => CreateDriverUseCase(sl()));
    sl.registerLazySingleton(() => GetRegionsUseCase(sl()));
    sl.registerLazySingleton(() => GetVehicleDetailssUseCase(sl()));
    sl.registerLazySingleton(() => DeleteDriverUseCase(sl()));
    sl.registerLazySingleton(() => UpdateDriversUseCase(sl()));

    /// repository
    sl.registerLazySingleton<BaseDriversRepository>(
        () => DriverRepository(baseDriverRemoteDataSource: sl()));

    /// data source
    sl.registerLazySingleton<BaseDriverRemoteDataSource>(
        () => DriverRemoteDataSource());
  }

  void _vehicleSl() {
    ///bloc
    sl.registerLazySingleton(() => VehicleBloc(sl(), sl(), sl(), sl(), sl()));

    ///use case
    sl.registerLazySingleton(() => GetVehicleUseCase(sl()));
    sl.registerLazySingleton(() => GetVehiclesUseCase(sl()));
    sl.registerLazySingleton(() => CreateVehicleUseCase(sl()));
    sl.registerLazySingleton(() => UpdateVehicleUseCase(sl()));
    sl.registerLazySingleton(() => DeleteVehicleUseCase(sl()));

    /// repository
    sl.registerLazySingleton<BaseVehicleRepository>(
        () => VehicleRepository(baseVehicleDataSource: sl()));

    /// data source
    sl.registerLazySingleton<BaseVehicleDataSource>(
        () => VehicleRemoteDataSource());
  }

  void _hieringRequestsSl() {
    //bloc
    sl.registerLazySingleton(
        () => HieringBloc(sl(), sl(), sl(), sl(), sl(), sl(), sl()));
    //use case
    sl.registerLazySingleton(() => GetHieringUseCase(sl()));
    sl.registerLazySingleton(() => GetHieringsUseCase(sl()));
    sl.registerLazySingleton(() => CreateHieringUseCase(sl()));
    sl.registerLazySingleton(() => UpdateHieringUseCase(sl()));
    sl.registerLazySingleton(() => DeleteHieringUseCase(sl()));
    //repository
    sl.registerLazySingleton<BaseHieringsRepository>(
        () => HieringRepository(baseHieringRemoteDataSource: sl()));
    //data suorce
    sl.registerLazySingleton<BaseHieringRemoteDataSource>(
        () => HieringRemoteDataSource());
  }
}
