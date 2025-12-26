// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  const Employee({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.title,
    required this.gender,
    required this.birthdate,
    required this.createdAt,
    required this.lastUpdatedAt,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String title;
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
      email,
      phoneNumber,
      title,
      gender,
      birthdate,
      createdAt,
      lastUpdatedAt
    ];
  }


  Employee copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? title,
    Gender? gender,
    String? birthdate,
    String? createdAt,
    String? lastUpdatedAt,
  }) {
    return Employee(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      title: title ?? this.title,
      gender: gender ?? this.gender,
      birthdate: birthdate ?? this.birthdate,
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
    );
  }
}
