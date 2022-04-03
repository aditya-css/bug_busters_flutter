import 'package:bug_busters_flutter/models/question_model.dart';
import 'package:bug_busters_flutter/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'answer_model.g.dart';

@JsonSerializable()
class AnswerModel {
  @JsonKey(name: "userId")
  final UserModel user;
  @JsonKey(name: "questionId")
  final QuestionModel question;
  final String description;
  final int vote;
  final bool isAccepted;

  AnswerModel({
    required this.user,
    required this.question,
    required this.description,
     this.vote=0,
    this.isAccepted = false,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerModelToJson(this);
}
