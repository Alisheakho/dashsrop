import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/entities/drivers.dart';

class DriverModel extends Drivers {
  const DriverModel(
      {required super.id,
      required super.firstName,
      required super.lastName,
      required super.email,
      required super.phoneNumber,
      required super.birthdate,
      required super.gender,
      required super.vehiclePlateNumber,
      required super.idNumber,
      required super.regionId,
      required super.vehicleDetailId,
      required super.createdAt,
      required super.lastUpdatedAt});

  factory DriverModel.fromJson(DataMap map) {
    return DriverModel(
        id: map['id'] as int,
        firstName: map['firstName'] as String,
        lastName: map['lastName'] as String,
        email: map['email'] as String,
        phoneNumber: map['phoneNumber'] as String,
        gender: map['gender'] as int,
        birthdate: map['birthdate'] as String,
        createdAt: map['createdAt'] as String,
        lastUpdatedAt: map['lastUpdatedAt'] as String,
        vehiclePlateNumber: map['vehiclePlateNumber'] as String,
        idNumber: map['idNumber'] as String,
        regionId: map['regionId'] as int ,
        vehicleDetailId: map['vehicleDetailId'] as int
        );
  }

}
