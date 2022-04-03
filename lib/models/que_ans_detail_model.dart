import 'package:bug_busters_flutter/models/question_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'que_ans_detail_model.g.dart';

@JsonSerializable()
class QueAnsDetailModel {
  QueAnsDetailModel({
    required this.question,
    required this.answer,
    required this.count,
  });
  final QuestionModel question;
  final List<QueAnsDetailModel> answer;
  final int count;

  factory QueAnsDetailModel.fromJson(Map<String, dynamic> json) =>
      _$QueAnsDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$QueAnsDetailModelToJson(this);
}