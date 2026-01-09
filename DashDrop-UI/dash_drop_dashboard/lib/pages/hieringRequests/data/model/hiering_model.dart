import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/domain/entities/hiering.dart';

class HieringModel extends Hiering {
  const HieringModel(
      {required super.id,
      required super.firstName,
      required super.lastName,
      required super.userID,
      required super.phoneNumber,
      required super.gender,
      required super.birthdate,
      required super.vehiclePlateNumber,
      required super.idNumber,
      required super.isAccepted,
      super.jobOffers,
      //required super.employee,
      required super.createdAt,
      required super.lastUpdatedAt,
      super.employeeId,
      required super.jobOfferId});
  factory HieringModel.fromJson(DataMap map) {
    return HieringModel(
        id: map['id'] as int,
        firstName: map['firstName'] as String,
        lastName: map['lastName'] as String,
        userID: map['userID'] as String,
        phoneNumber: map['phoneNumber'] as String,
        idNumber: map['idNumber'] as String,
        vehiclePlateNumber: map['vehiclePlateNumber'] as String,
        isAccepted: map['isAccepted'] as bool,
        gender: map['gender'] == 0 ? Gender.male : Gender.female,
        birthdate: map['birthdate'] as String,
        //employeeId: map['employeeId'],
        jobOfferId: map['jobOfferId'],
        //employee: EmployeeModel.fromJson(map['employee'] ?? {}),
        //jobOffer: JobOfferModel.fromJson(map['jobOffer'] ?? {}),
        createdAt: map['createdAt'] as String,
        lastUpdatedAt: map['lastUpdatedAt'] as String);
  }
}
