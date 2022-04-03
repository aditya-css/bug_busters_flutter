import 'package:bug_busters_flutter/api_service/api_client_service.dart';
import 'package:bug_busters_flutter/core/constants/api.dart';
import 'package:bug_busters_flutter/models/que_ans_detail_model.dart';
import 'package:bug_busters_flutter/models/question_model.dart';
import 'package:dio/dio.dart';

class ApiRepo {

  static final  apiRepo = ApiConst.client;

  static Future<List<QuestionModel>> getAllQuestions() async {
    try {
      final List<QuestionModel> _response = await apiRepo.getAllQuestions();
      return _response;
    } on Exception catch (e) {
      print(" ${e.toString()}");
    }
    return Future.error("error");
  }

  static Future<Map<String,int>> getTotalQues() async {
    try {
      final  _response = await apiRepo.getTotalQues();
      return _response;
    } on Exception catch (e) {
      print("${e.toString()}");
    }
    return Future.error("error");
  }

  static Future<QueAnsDetailModel> getQueAnsDetail(String queId) async {
    try {
      final  _response = await apiRepo.getQueAnsDetails(queId);
      return _response;
    } on Exception catch (e) {
      print("${e.toString()}");
    }
    return Future.error("error");
  }


  // static Future<String> login() async {
  //   try {
  //     final  _response = await apiRepo.loginUser({'email': 'pradip@gmail.com', 'password': 'Vivek@3241'});
  //     return _response.token;
  //   } on Exception catch (e) {
  //     print("${e.toString()}");
  //   }
  //   return "";
  // }
}
