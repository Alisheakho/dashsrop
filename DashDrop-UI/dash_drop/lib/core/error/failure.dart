import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure({required this.message, required this.statusCode,this.errors});

  final String message;
  final int statusCode;
  final Map? errors;
 

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.statusCode, required super.message,super.errors});
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({required super.statusCode, required super.message});
}
