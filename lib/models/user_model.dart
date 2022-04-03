import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String name;
  final String email;
  final String password;
  final String? publicAddress;
  final int totalRewards;
  final String avatar;
  final String? createdAt;
  final String? updatedAt;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    this.publicAddress,
    this.totalRewards = 0,
    required this.avatar,
     this.createdAt,
     this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
