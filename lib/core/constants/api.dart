import 'package:bug_busters_flutter/api_service/api_client_service.dart';
import 'package:dio/dio.dart';
import 'package:network_logger/network_logger.dart';

class ApiConst {
  //base
  static const String kBaseUrl = 'https://metastack.herokuapp.com';


  static const String kAllQuestion = '/question/viewQuestions';
  static const String kTotalQuestion = '/question/totalQuestion';
  static const String kUserRegister = '/user/register';
  static const String kUserLogin = '/user/login';
  static const String kTotalCount = '/question/totalQuestion';
  static const String kQueAnsDetail = '/answer/{id}';

  static const String kJsonContentType = 'application/json';


  static ApiClientService client = ApiClientService(Dio(
    BaseOptions(
      headers: const <String, String>{
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      },

      ///token
      baseUrl: kBaseUrl,

  )));

}
