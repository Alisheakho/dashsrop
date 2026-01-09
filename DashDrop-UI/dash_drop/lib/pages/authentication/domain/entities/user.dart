import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String role;
  final String text;
  final int regionid;
  final String dateofbirth;

  const User({
    required this.id,
    required this.name,
    required this.role,
    required this.text,
    required this.regionid,
    required this.dateofbirth,
  });

  @override
  List<Object> get props {
    return [id, name, role, text, regionid, dateofbirth];
  }
}
