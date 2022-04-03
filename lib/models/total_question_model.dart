import 'package:json_annotation/json_annotation.dart';

part 'total_question_model.g.dart';

@JsonSerializable()
class TotalQuestion {
  final int totalQuestion;

  TotalQuestion({
    required this.totalQuestion,
  });

  factory TotalQuestion.fromJson(Map<String, dynamic> json) =>
      TotalQuestion(totalQuestion: json['totalQuestion'] as int);

  Map<String, dynamic> toJson() => {
        'totalQuestion': totalQuestion,
      };
}
