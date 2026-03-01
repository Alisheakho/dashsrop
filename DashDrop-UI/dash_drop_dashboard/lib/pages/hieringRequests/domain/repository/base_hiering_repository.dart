import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/domain/entities/hiering.dart';

abstract class BaseHieringsRepository {
  ResultFuture<List<Hiering>> getHierings();

  ResultFuture<Hiering> getHiering({required int id});

  ResultFuture<Hiering> createHierings(
      {required String firstName,
      required String lastName,
      required String userID,
      required String phoneNumber,
      required String vehiclePlateNumber,
      required String idNumber,
      required bool isAccepted,
      //required Employee employee,
      required int jobOfferId,
      required Gender gender,
      required String birthdate});

  ResultVoid updateHierings(
      {required int id,
      required String firstName,
      required String lastName,
      required String userID,
      required String phoneNumber,
      required String vehiclePlateNumber,
      required String idNumber,
      required bool isAccepted,
      required int jobOfferId,
      required Gender gender,
      required String birthdate});

  ResultVoid deleteHierings({required int id});
}
