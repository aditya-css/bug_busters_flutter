
import 'package:bug_busters_flutter/api_service/api_client_service.dart';
import 'package:dio/dio.dart';

class ApiConst {

  // static const String kBaseUrl = 'http://172.16.1.217:4000/';
  static const String kBaseUrl = 'https://metastack.herokuapp.com';

  static const String kAllQuestion = '/question/viewQuestions';
  static const String kTotalCount = '/question/totalQuestion';
  static const String kUserLogin = '/user/login';
  static const String kQueAnsDetail = '/answer/{id}';

  static const String kJsonContentType = 'application/json';


  static ApiClientService client = ApiClientService(
    Dio(
      BaseOptions(
        baseUrl: kBaseUrl,
        headers: {
          "Access-Control-Allow-Origin": "*",
        },
        // contentType: ApiConst.kJsonContentType,
      ),
    ),
  );

}
