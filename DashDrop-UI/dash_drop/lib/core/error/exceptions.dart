// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../network/error_message.dart';

class ServerException implements Exception {
  final int? statusCode;
  final ErrorMessageModel errorMessageModel;

  const ServerException(
      {required this.statusCode, required this.errorMessageModel});
}

class AuthException implements Exception {
  final int? statusCode;
  final String? authMessage;
  AuthException({
    required this.statusCode,
    required this.authMessage,
  });

  @override
  String toString() => 'AuthException(statusCode: $statusCode, authMessage: $authMessage)';
}
