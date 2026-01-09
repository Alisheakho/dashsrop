import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/domain/repository/base_hiering_repository.dart';
import 'package:equatable/equatable.dart';

class UpdateHieringUseCase extends BaseUseCase<void, UpdateHieringParameters> {
  UpdateHieringUseCase(this.baseHieringsRepository);

  final BaseHieringsRepository baseHieringsRepository;

  @override
  ResultVoid call(UpdateHieringParameters parameters) async =>
      baseHieringsRepository.updateHierings(
        id: parameters.id,
        firstName: parameters.firstName,
        lastName: parameters.lastName,
        userID: parameters.userID,
        phoneNumber: parameters.phoneNumber,
        isAccepted: parameters.isAccepted,
        gender: parameters.gender,
        birthdate: parameters.birthdate,
        vehiclePlateNumber: parameters.vehiclePlateNumber,
        idNumber: parameters.idNumber,
        jobOfferId: parameters.jobOfferId,
      );
}

class UpdateHieringParameters extends Equatable {
  const UpdateHieringParameters({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userID,
    required this.phoneNumber,
    required this.gender,
    required this.birthdate,
    required this.vehiclePlateNumber,
    required this.isAccepted,
    required this.idNumber,
    required this.jobOfferId,
  });
  final int id;
  final String firstName;
  final String lastName;
  final String userID;
  final String phoneNumber;
  final Gender gender;
  final String birthdate;
  final String vehiclePlateNumber;
  final String idNumber;
  final bool isAccepted;
  final int jobOfferId;

  @override
  List<Object> get props {
    return [
      firstName,
      lastName,
      userID,
      phoneNumber,
      gender,
      birthdate,
      vehiclePlateNumber,
      idNumber,
      jobOfferId,
      isAccepted
    ];
  }
}
