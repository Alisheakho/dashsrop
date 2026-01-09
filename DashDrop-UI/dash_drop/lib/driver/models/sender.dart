import 'package:equatable/equatable.dart';

class Sender extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String userID;

  const Sender({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.userID,
  });
  factory Sender.fromJson(Map<String, dynamic> map) {
    return Sender(
      id: map['id'],
      userID: map['userID'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      phoneNumber: map['phoneNumber'],
    );
  }
  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    lastName,
    phoneNumber,
    userID,
  ];
}
