part of 'hiering_bloc.dart';

abstract class HieringEvent extends Equatable {}

class GetHieringsEvent extends HieringEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetHieringEvent extends HieringEvent {
  final int id;

  GetHieringEvent({required this.id});

  @override
  List<Object?> get props => [id];

  @override
  String toString() => 'GetHieringsEvent(id: $id)';
}

class DeleteHieringEvent extends HieringEvent {
  final int id;

  DeleteHieringEvent({required this.id});

  @override
  List<Object?> get props => [id];

  @override
  String toString() => 'DeleteHieringEvent(id: $id)';
}

class CreateHieringEvent extends HieringEvent {
  final String firstName;
  final String lastName;
  final String userID;
  final String phoneNumber;
  final Gender gender;
  final String birthdate;
  final String vehiclePlateNumber;
  final String idNumber;
  final bool isAccepted;
  final int jobOfferId;

  CreateHieringEvent({
    required this.firstName,
    required this.lastName,
    required this.userID,
    required this.phoneNumber,
    required this.gender,
    required this.birthdate,
    required this.vehiclePlateNumber,
    required this.idNumber,
    required this.isAccepted,
    required this.jobOfferId,
  });

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
      jobOfferId,
      isAccepted
    ];
  }
}

class UpdateHieringEvent extends HieringEvent {
  final int id;
  final String firstName;
  final String lastName;
  final String userID;
  final String phoneNumber;
  final Gender gender;
  final String birthdate;
  final String vehiclePlateNumber;
  final String idNumber;
  final bool isAccepted;
  final int jobOfferId;

  UpdateHieringEvent({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userID,
    required this.phoneNumber,
    required this.gender,
    required this.birthdate,
    required this.vehiclePlateNumber,
    required this.idNumber,
    required this.isAccepted,
    required this.jobOfferId,
  });

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
      jobOfferId,
      isAccepted
    ];
  }
}
