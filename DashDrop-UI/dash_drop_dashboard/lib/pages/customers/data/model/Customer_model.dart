
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/customers/domain/entities/customer.dart';


class CustomerModel extends Customer {
  const CustomerModel(
      {required super.id,
      required super.firstName,
      required super.lastName,
      required super.email,
      required super.phoneNumber,
      required super.gender,
      required super.birthdate,
      required super.createdAt,
      required super.lastUpdatedAt});

  factory CustomerModel.fromJson(DataMap map) {
    return CustomerModel(
        id: map['id'] as int ,
        firstName: map['firstName'] as String,
        lastName: map['lastName'] as String,
        email: map['email'] as String,
        phoneNumber: map['phoneNumber'] as String,
        gender: map['gender']==0 ? Gender.male:Gender.female,
        birthdate: map['birthdate'] as String,
        createdAt: map['createdAt'] as String,
        lastUpdatedAt: map['lastUpdatedAt'] as String);
  }


 CustomerModel copyWith({
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
    return CustomerModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
      birthdate: birthdate ?? this.birthdate,
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
      
    );
  }
}
