import 'package:equatable/equatable.dart';

class Drivers extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String userID;
  final String phoneNumber;
  final int gender;
  final String birthdate;
  final String vehiclePlateNumber;
  final String idNumber;
  final int regionId;
  final int vehicleDetailId;
  final String createdAt;
  final String lastUpdatedAt;

  const Drivers(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.userID,
      required this.phoneNumber,
      required this.gender,
      required this.birthdate,
      required this.vehiclePlateNumber,
      required this.idNumber,
      required this.regionId,
      required this.vehicleDetailId,
      required this.createdAt,
      required this.lastUpdatedAt});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        userID,
        phoneNumber,
        gender,
        birthdate,
        vehicleDetailId,
        idNumber,
        regionId,
        vehicleDetailId,
        createdAt,
        lastName
      ];

  Drivers copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? userID,
    String? phoneNumber,
    String? vehiclePlateNumber,
    int? vehicleDetailId,
    int? regionId,
    String? idNumber,
    int? gender,
    String? birthdate,
    String? createdAt,
    String? lastUpdatedAt,
  }) {
    return copyWith(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userID: userID ?? this.userID,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
      birthdate: birthdate ?? this.birthdate,
      vehiclePlateNumber: vehiclePlateNumber ?? this.vehiclePlateNumber,
      vehicleDetailId: vehicleDetailId ?? this.vehicleDetailId,
      regionId: regionId ?? this.regionId,
      idNumber: idNumber ?? this.idNumber,
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
    );
  }
}

// {
//     "id": 0,
//     "firstName": "string",
//     "lastName": "string",
//     "userID": "user@example.com",
//     "phoneNumber": "string",
//     "gender": 0,
//     "birthdate": "2024-08-08",
//     "vehiclePlateNumber": "string",
//     "idNumber": "string",
//     "regionId": 0,
//     "vehicleDetailId": 0,
//     "createdAt": "2024-08-08T12:07:45.266Z",
//     "lastUpdatedAt": "2024-08-08T12:07:45.266Z"
//   }
