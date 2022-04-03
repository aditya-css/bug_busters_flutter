// import 'package:json_annotation/json_annotation.dart';
//
// part 'question_model.g.dart';
//
// @JsonSerializable()
// class QuestionModel {
//   final String id;
//   final String uid;
//   final String question;
//   final String description;
//   final DateTime dateAndTime;
//   final String? urlToImage;
//   final String? content;
//
//   QuestionModel({
//     required this.title,
//     required this.publishedAt,
//     this.author,
//     this.description,
//     this.urlToImage,
//     this.url,
//     this.content,
//   });
//
//   factory QuestionModel.fromJson(Map<String, dynamic> json) =>
//       _$QuestionModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
// }