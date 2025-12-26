import 'package:equatable/equatable.dart';

class Reciver extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;

  const Reciver(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.email});

  factory Reciver.fromJson(Map<String, dynamic> map) {
    return Reciver(
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
/**"reciverCustomer": {
            "id": 2,
            "firstName": "Husam",
            "lastName": "Al-Mohamad",
            "email": "husam@example.com",
            "phoneNumber": "11223344556",
            "birthdate": "1988-05-05",
            "gender": 0,
            "regionId": 1,
            "createdAt": "2024-08-23T17:10:23.0418687",
            "lastUpdatedAt": "2024-08-23T17:10:23.0418687"
        }, */