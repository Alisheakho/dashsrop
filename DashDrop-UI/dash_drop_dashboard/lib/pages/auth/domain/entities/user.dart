// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String role;
  final String text;
  final String title;
  final String dateofbirth;

  const User({
    required this.id,
    required this.name,
    required this.role,
    required this.text,
    required this.title,
    required this.dateofbirth,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      role,
      text,
      title,
      dateofbirth,
    ];
  }
}
