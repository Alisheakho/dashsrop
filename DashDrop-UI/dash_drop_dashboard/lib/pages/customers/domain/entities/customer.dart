// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  const Customer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userID,
    required this.phoneNumber,
    required this.gender,
    required this.birthdate,
    required this.createdAt,
    required this.lastUpdatedAt,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String userID;
  final String phoneNumber;
  final Gender gender;
  final String birthdate;
  final String createdAt;
  final String lastUpdatedAt;

  @override
  List<Object> get props {
    return [
      id,
      firstName,
      lastName,
      userID,
      phoneNumber,
      gender,
      birthdate,
      createdAt,
      lastUpdatedAt
    ];
  }

  Customer copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? userID,
    String? phoneNumber,
    String? title,
    Gender? gender,
    String? birthdate,
    String? createdAt,
    String? lastUpdatedAt,
  }) {
    return Customer(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userID: userID ?? this.userID,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
      birthdate: birthdate ?? this.birthdate,
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
    );
  }
}
