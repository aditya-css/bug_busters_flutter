import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponse {
  final String token;

  LoginResponse({
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      LoginResponse(token: json['token'] as String);

  Map<String, dynamic> toJson() => {
        'token': token,
      };
}
