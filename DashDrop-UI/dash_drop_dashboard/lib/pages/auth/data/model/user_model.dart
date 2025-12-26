import 'package:dash_drop_dashboard/pages/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {required super.id,
      required super.name,
      required super.role,
      required super.emailaddress,
      required super.title,
      required super.dateofbirth});

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: int.parse(map[
          'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier']),
      name: map['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name']
          as String,
      role: map['http://schemas.microsoft.com/ws/2008/06/identity/claims/role']
          as String,
      emailaddress:
          map['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress']
              as String,
      title: map['title'] as String,
      dateofbirth:
          map['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/dateofbirth']
              as String,
    );
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? role,
    String? emailaddress,
    String? title,
    String? dateofbirth,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      role: role ?? this.role,
      emailaddress: emailaddress ?? this.emailaddress,
      title: title ?? this.title,
      dateofbirth: dateofbirth ?? this.dateofbirth,
    );
  }
}
