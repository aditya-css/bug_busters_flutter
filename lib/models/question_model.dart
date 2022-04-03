import 'package:bug_busters_flutter/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_model.g.dart';

@JsonSerializable()
class QuestionModel {
  @JsonKey(name: "user_id")
  final UserModel user;
  final String question;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> tags;
  final int vote;

  QuestionModel({
    required this.user,
    required this.question,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.tags,
     this.vote=0,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}
