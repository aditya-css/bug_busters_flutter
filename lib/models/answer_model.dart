import 'package:bug_busters_flutter/models/question_model.dart';
import 'package:bug_busters_flutter/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'answer_model.g.dart';

@JsonSerializable()
class AnswerModel {
  final String userId;
  @JsonKey(name: "questionId")
  final QuestionModel question;
  final String description;
  final String createdAt;
  final String updatedAt;
  final int vote;
  final bool isAccepted;

  AnswerModel({
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.question,
    required this.description,
    this.vote = 0,
    this.isAccepted = false,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerModelToJson(this);
}
