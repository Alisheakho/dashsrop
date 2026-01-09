import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.role,
    required super.text,
    required super.regionid,
    required super.dateofbirth,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: int.parse(
        map['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier'],
      ),
      name:
          map['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name']
              as String,
      role:
          map['http://schemas.microsoft.com/ws/2008/06/identity/claims/role']
              as String,
      text:
          map['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/text']
              as String,
      regionid: int.tryParse(map['regionid'] ?? '') ?? 0,
      dateofbirth:
          map['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/dateofbirth']
              as String,
    );
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? role,
    String? text,
    int? regionid,
    String? dateofbirth,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      role: role ?? this.role,
      text: text ?? this.text,
      regionid: regionid ?? this.regionid,
      dateofbirth: dateofbirth ?? this.dateofbirth,
    );
  }
}
