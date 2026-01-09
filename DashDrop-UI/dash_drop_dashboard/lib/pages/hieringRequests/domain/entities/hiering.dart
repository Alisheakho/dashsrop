import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/domain/entities/job_offer.dart';
import 'package:equatable/equatable.dart';

class Hiering extends Equatable {
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
  final int? employeeId;
  final List<JobOffer>? jobOffers;
  //final Employee employee;
  final String createdAt;
  final String lastUpdatedAt;

  const Hiering(
      {this.jobOffers,
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
      //required this.employee,
      this.employeeId,
      required this.jobOfferId,
      required this.createdAt,
      required this.lastUpdatedAt});

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        userID,
        phoneNumber,
        gender,
        birthdate,
        isAccepted,
        idNumber,
        jobOffers,
        // employee,
        createdAt,
        lastName
      ];

  Hiering copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? userID,
    String? phoneNumber,
    String? vehiclePlateNumber,
    bool? isAccepted,
    // Employee? employee,
    List<JobOffer>? jobOffers,
    String? idNumber,
    Gender? gender,
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
      //employee: employee ?? this.employee,
      jobOffers: jobOffers ?? this.jobOffers,
      isAccepted: isAccepted ?? this.isAccepted,
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
//     "vehiclePlateNumber": "string",
//     "idNumber": "string",
//     "gender": 0,
//     "birthdate": "2024-08-18",
//     "isAccepted": true,
//     "jobOfferId": 0,
//     "employeeId": 0,
//     "createdAt": "2024-08-18T17:07:23.944Z",
//     "lastUpdatedAt": "2024-08-18T17:07:23.944Z"
//   }