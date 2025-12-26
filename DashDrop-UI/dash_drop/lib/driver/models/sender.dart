
import 'package:equatable/equatable.dart';

class Sender extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;

  const Sender(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.email});
 factory Sender.fromJson(Map<String, dynamic> map) {
    return Sender(
        id: map['id'],
        email: map['email'],
        firstName: map['firstName'],
        lastName: map['lastName'],
        phoneNumber: map['phoneNumber']);
  }
  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        lastName,
        phoneNumber,
        email,
      ];
}