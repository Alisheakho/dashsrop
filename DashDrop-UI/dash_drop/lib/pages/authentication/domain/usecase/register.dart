// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dash_drop/core/usecase/base_usecase.dart';
import 'package:dash_drop/core/utils/enums.dart';
import 'package:dash_drop/core/utils/typedef.dart';
import 'package:dash_drop/pages/authentication/domain/repository/base_auth_repository.dart';
import 'package:equatable/equatable.dart';

class RegisterUseCase extends BaseUseCase<void, RegisterParameters> {
  RegisterUseCase(this.authRepository);

  final BaseAuthRepository authRepository;

  @override
  ResultVoid call(RegisterParameters parameters) async =>
      authRepository.register(
          firstName: parameters.firstName,
          lastName: parameters.lastName,
          email: parameters.email,
          password: parameters.password,
          phoneNumber: parameters.phoneNumber,
          gender: parameters.gender,
          birthdate: parameters.birthdate,
          );
}

class RegisterParameters extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phoneNumber;
  final Gender gender;
  final String birthdate;  
  
  const RegisterParameters({
    required  this.firstName,
    required  this.lastName,
    required  this.email,
    required  this.password,
    required  this.phoneNumber,
    required  this.gender,
    required  this.birthdate
  });



  @override
  List<Object> get props {
    return [
      firstName,
      lastName,
      email,
      password,
      phoneNumber,
      gender,
      birthdate,
    ];
  }
}
