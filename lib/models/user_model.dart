import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String name;
  final String email;
  final String password;
  final String? publicAddress;
  final double totalRewards;
  final String avatar;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    this.publicAddress,
    this.totalRewards = 0,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
