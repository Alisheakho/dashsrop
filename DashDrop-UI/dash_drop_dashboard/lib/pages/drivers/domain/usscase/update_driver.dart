import 'package:equatable/equatable.dart';
import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';

import '../repository/base_drivers_repository.dart';

class UpdateDriversUseCase extends BaseUseCase<void, UpdateDriversParameters> {
  UpdateDriversUseCase(this.driversRepository);

  final BaseDriversRepository driversRepository;

  @override
  ResultVoid call(UpdateDriversParameters parameters) async =>
      driversRepository.updateDrivers(
        id: parameters.id,
        firstName: parameters.firstName,
        lastName: parameters.lastName,
        userID: parameters.userID,
        phoneNumber: parameters.phoneNumber,
        password: parameters.password,
        gender: parameters.gender,
        birthdate: parameters.birthdate,
        vehiclePlateNumber: parameters.vehiclePlateNumber,
        idNumber: parameters.idNumber,
        regionId: parameters.regionId,
        vehicleDetailId: parameters.vehicleDetailId,
      );
}

class UpdateDriversParameters extends Equatable {
  const UpdateDriversParameters({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userID,
    required this.phoneNumber,
    required this.gender,
    required this.birthdate,
    required this.vehiclePlateNumber,
    required this.password,
    required this.idNumber,
    required this.regionId,
    required this.vehicleDetailId,
  });
  final int id;
  final String firstName;
  final String lastName;
  final String userID;
  final String phoneNumber;
  final int gender;
  final String birthdate;
  final String vehiclePlateNumber;
  final String password;
  final String idNumber;
  final int regionId;
  final int vehicleDetailId;

  @override
  List<Object> get props {
    return [
      firstName,
      lastName,
      userID,
      phoneNumber,
      gender,
      birthdate,
      vehiclePlateNumber,
      idNumber,
      regionId,
      vehicleDetailId,
    ];
  }
}
