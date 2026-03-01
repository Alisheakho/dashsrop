import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';

import '../../domain/entities/employee.dart';

class EmployeeModel extends Employee {
  const EmployeeModel(
      {required super.id,
      required super.firstName,
      required super.lastName,
      required super.userID,
      required super.phoneNumber,
      required super.title,
      required super.gender,
      required super.birthdate,
      required super.createdAt,
      required super.lastUpdatedAt});

  factory EmployeeModel.fromJson(DataMap map) {
    return EmployeeModel(
        id: map['id'] as int,
        firstName: map['firstName'] as String,
        lastName: map['lastName'] as String,
        userID: map['userID'] as String,
        phoneNumber: map['phoneNumber'] as String,
        title: map['title'] as String,
        gender: map['gender'] == 0 ? Gender.male : Gender.female,
        birthdate: map['birthdate'] as String,
        createdAt: map['createdAt'] as String,
        lastUpdatedAt: map['lastUpdatedAt'] as String);
  }

  EmployeeModel copyWith({
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
    return EmployeeModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userID: userID ?? this.userID,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      title: title ?? this.title,
      gender: gender ?? this.gender,
      birthdate: birthdate ?? this.birthdate,
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
    );
  }
}
