import 'package:dash_drop/core/utils/enums.dart';
import 'package:dash_drop/core/utils/typedef.dart';
import 'package:dash_drop/pages/authentication/domain/entities/user.dart';

abstract class BaseAuthRepository {
  ResultFuture<User> getUser();

  ResultVoid login({required String email, required String password});

  ResultVoid register(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String phoneNumber,
      required Gender gender,
      required String birthdate});

  ResultVoid logout();

  ResultFuture<bool> isAuthorized();
}
