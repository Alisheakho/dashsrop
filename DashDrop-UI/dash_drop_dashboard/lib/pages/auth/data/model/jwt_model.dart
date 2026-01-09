import 'dart:convert';
import 'package:equatable/equatable.dart';

class JwtModel extends Equatable {
  final String token;
  final String refreshToken;

  const JwtModel({
    required this.token,
    required this.refreshToken,
  });

  JwtModel copyWith({
    String? token,
    String? refreshToken,
  }) {
    return JwtModel(
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token, // Changed from 'jwtToken' to match server standard
      'refreshToken': refreshToken,
    };
  }

  factory JwtModel.fromJson(Map<String, dynamic> map) {
    return JwtModel(
      // FIX: Check for 'token' (what server sends) OR 'jwtToken' (fallback)
      token: (map['token'] ?? map['jwtToken']) as String? ?? "",

      // FIX: Handle refreshToken being null safely
      refreshToken: (map['refreshToken'] as String?) ?? "",
    );
  }

  factory JwtModel.fromStr(String str) {
    Map<String, dynamic> json = jsonDecode(str);
    return JwtModel.fromJson(json); // Reuse the safe logic above
  }

  String toJson() => jsonEncode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [token, refreshToken];
}
