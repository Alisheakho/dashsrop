import 'package:dash_drop_dashboard/pages/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {required super.id,
      required super.name,
      required super.role,
      required super.text,
      required super.title,
      required super.dateofbirth});

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] is int
          ? map['id']
          : int.tryParse(map['id'].toString()) ?? 0,
      name: map['name'] ?? "",
      role: map['role'] ?? "employee",
      text: map['text'] ?? "",
      title: map['title'] ?? "",
      dateofbirth: map['dateofbirth'] ?? "",
    );
  }

  @override
  UserModel copyWith({
    int? id,
    String? name,
    String? role,
    String? text,
    String? title,
    String? dateofbirth,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      role: role ?? this.role,
      text: text ?? this.text,
      title: title ?? this.title,
      dateofbirth: dateofbirth ?? this.dateofbirth,
    );
  }
}
