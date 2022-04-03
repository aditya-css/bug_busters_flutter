import 'package:json_annotation/json_annotation.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
class UserResponseModel {
  UserResponseModel({
    required this.name,
    required this.email,
    required this.password,
    this.publicAddress,
    required this.avatar,
    required this.totalRewards,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  final String name;
  final String email;
  final String password;
  final String? publicAddress;
  final String avatar;
  final int totalRewards;
  @JsonKey(name: '_id')
  final String id;
  final String createdAt;
  final String updatedAt;

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);
}
