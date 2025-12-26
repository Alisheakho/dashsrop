// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/entities/drivers.dart';
import 'package:equatable/equatable.dart';

import '../repository/base_drivers_repository.dart';

class CreateDriverUseCase
    extends BaseUseCase<void, CreateDriverParameters> {
  CreateDriverUseCase(this.driversRepository);

  final BaseDriversRepository driversRepository;

  @override
  ResultFuture<Drivers> call(CreateDriverParameters parameters) async {
    return driversRepository.createDrivers(
      firstName: parameters.firstName,
      lastName: parameters.lastName,
      email: parameters.email,
      phoneNumber: parameters.phoneNumber,
      gender: parameters.gender,
      birthdate: parameters.birthdate,
      password: parameters.password,
      vehiclePlateNumber: parameters.vehiclePlateNumber,
      idNumber: parameters.idNumber,
      regionId: parameters.regionId,
      vehicleDetailId: parameters.vehicleDetailId,
    );
  }
}

class CreateDriverParameters extends Equatable {
const CreateDriverParameters({
  required this.firstName,
  required this.lastName,
  required this.email,
  required this.phoneNumber,
  required this.gender,
  required this.birthdate,
  required this.vehiclePlateNumber,
  required this.password,
  required this.idNumber,
  required this.regionId,
  required this.vehicleDetailId,
});

  final String firstName;
  final String lastName;
  final String email;
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
      email,
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
