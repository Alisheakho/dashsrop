import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String message;
  final Map? errors;

  const ErrorMessageModel(
      {required this.statusCode, required this.message, this.errors});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
        statusCode: json["status"] ?? 666,
        message: json["title"] ?? json["error"] ?? "",
        errors: json["errors"]);
  }

  @override
  List<Object?> get props => [statusCode, message, errors];
}
