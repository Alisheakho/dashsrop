import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/failure.dart';
import 'auth_remote_data_source.dart';
import '../model/jwt_model.dart';
import '../model/user_model.dart';

abstract class BaseUserLocalDataSource {
  Future<void> storeToken({required JwtModel jwt});

  Future<bool> isAuthorized();

  Future<UserModel> getUser();
  Future<void> logout();
}

class UserLocalDataSource extends BaseUserLocalDataSource {
  final BaseUserRemoteDataSource baseUserRemoteDataSource;

  UserLocalDataSource(this.baseUserRemoteDataSource);

  late SharedPreferences prefs;

  @override
  Future<UserModel> getUser() async {
    prefs = await SharedPreferences.getInstance();
    final String? jwt = prefs.getString('jwt');
    if (jwt != null) {
      String token = JwtModel.fromStr(jwt).token;
      Map<String, dynamic> playload = JwtDecoder.decode(token);
      return UserModel.fromJson(playload);
    } else {
      throw const DatabaseFailure(
          statusCode: 404, message: "Some Erorr happen");
    }
  }

  @override
  Future<bool> isAuthorized() async {
    prefs = await SharedPreferences.getInstance();
    final String? jwt = prefs.getString('jwt');
    if (jwt != null) {
      JwtModel jwtModel = JwtModel.fromStr(jwt);
      Duration remainingTime = JwtDecoder.getRemainingTime(jwtModel.token);
      if (remainingTime < const Duration(seconds: 30)) {
        try {
          final JwtModel result =
              await baseUserRemoteDataSource.refreshToken(jwtModel: jwtModel);
          storeToken(jwt: result);
          print('jwt rrfreshed : ' + result.token);
          return true;
        } catch (e) {
          print(e.toString());
          logout();
          // return false;
        }
      }
      return true;
    }
    return false;
  }

  @override
  Future<void> storeToken({required JwtModel jwt}) async {
    prefs = await SharedPreferences.getInstance();
    try {
      await prefs.setString('jwt', jwt.toJson());
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> logout() async {
    prefs = await SharedPreferences.getInstance();
    try {
      await prefs.remove('jwt');
    } catch (e) {
      print(e);
      throw const DatabaseFailure(
          statusCode: 404, message: "Some Erorr happen");
    }
  }
}
