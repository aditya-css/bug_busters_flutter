import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequest {
  final String email, pass;

  LoginRequest({
    required this.email,
    required this.pass,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        email: json['email'] as String,
        pass: json['password'] as String,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': pass,
      };
}
