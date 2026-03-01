import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';

import '../../domain/entities/employee.dart';

class EmployeeModel extends Employee {
  const EmployeeModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.userID,
    required super.phoneNumber,
    required super.title,
    required super.gender,
    required super.birthdate,
    required super.createdAt,
    required super.lastUpdatedAt,
  });
  static String _validateDate(dynamic date) {
    if (date == null || date.toString().trim().isEmpty) {
      return DateTime.now().toIso8601String();
    }
    return date.toString();
  }

  factory EmployeeModel.fromJson(DataMap map) {
    return EmployeeModel(
      id: (map['id'] as int?) ?? 0,
      firstName: map['firstName']?.toString() ?? "",
      lastName: map['lastName']?.toString() ?? "",
      userID: map['userID']?.toString() ?? "",
      phoneNumber: map['phoneNumber']?.toString() ?? "",
      title: map['title']?.toString() ?? "",
      gender: (map['gender'] == 1) ? Gender.female : Gender.male,
      birthdate: _validateDate(map['birthdate']),
      createdAt: _validateDate(map['createdAt']),
      lastUpdatedAt: _validateDate(map['lastUpdatedAt']),
    );
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
