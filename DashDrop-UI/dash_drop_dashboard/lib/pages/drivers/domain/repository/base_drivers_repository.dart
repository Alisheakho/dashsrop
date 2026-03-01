import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/entities/drivers.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/entities/regions.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/entities/vehicle_details.dart';

abstract class BaseDriversRepository {
  ResultFuture<List<Drivers>> getDrivers();

  ResultFuture<Drivers> getDriver({required int id});

  ResultFuture<List<Regions>> getRegions();

  ResultFuture<List<VehicleDetails>> getVehicleDetails();

  ResultFuture<Drivers> createDrivers(
      {required String firstName,
      required String lastName,
      required String userID,
      required String phoneNumber,
      required String vehiclePlateNumber,
      required String password,
      required String idNumber,
      required int regionId,
      required int vehicleDetailId,
      required int gender,
      required String birthdate});

  ResultVoid updateDrivers(
      {required int id,
      required String firstName,
      required String lastName,
      required String userID,
      required String phoneNumber,
      required String vehiclePlateNumber,
      required String password,
      required String idNumber,
      required int regionId,
      required int vehicleDetailId,
      required int gender,
      required String birthdate});

  ResultVoid deleteDrivers({required int id});
}
