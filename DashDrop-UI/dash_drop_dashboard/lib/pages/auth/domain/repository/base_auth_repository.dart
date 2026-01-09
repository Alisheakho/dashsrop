import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/auth/domain/entities/user.dart';

abstract class BaseAuthRepository {
  ResultFuture<User> getUser();

  ResultVoid login({required String userID, required String password});

  ResultVoid resetPassword(
      {required String userID,
      required String oldPassword,
      required String newPassword});

  ResultVoid logout();

  ResultFuture<bool> isAuthorized();
}
