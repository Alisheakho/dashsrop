part of 'driver_bloc.dart';

abstract class DriverEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetDriversEvent extends DriverEvent {}

class GetDriverEvent extends DriverEvent {
  final int id;

  GetDriverEvent({required this.id});

  @override
  List<Object?> get props => [id];

  @override
  String toString() => 'GetDriversEvent(id: $id)';
}

class CreateDriverEvent extends DriverEvent {
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

  CreateDriverEvent(
      {required this.firstName,
      required this.lastName,
      required this.userID,
      required this.phoneNumber,
      required this.gender,
      required this.birthdate,
      required this.vehiclePlateNumber,
      required this.password,
      required this.idNumber,
      required this.regionId,
      required this.vehicleDetailId});

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        userID,
        phoneNumber,
        gender,
        birthdate,
        vehiclePlateNumber,
        vehicleDetailId,
        password,
        idNumber,
        regionId
      ];
}

class UpdateDriverEvent extends DriverEvent {
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

  UpdateDriverEvent(
      {required this.id,
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
      required this.vehicleDetailId});

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        userID,
        phoneNumber,
        gender,
        birthdate,
        vehiclePlateNumber,
        vehicleDetailId,
        password,
        idNumber,
        regionId
      ];
}

class DeleteDriverEvent extends DriverEvent {
  DeleteDriverEvent({
    required this.id,
  });

  final int id;

  @override
  List<Object?> get props => [id];
}

class GetRegVegEvent extends DriverEvent {}
