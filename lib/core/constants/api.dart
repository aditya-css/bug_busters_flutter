import 'package:bug_busters_flutter/api_service/api_client_service.dart';
import 'package:dio/dio.dart';
import 'package:network_logger/network_logger.dart';

class ApiConst {
  //base
  static const String kBaseUrl = 'https://metastack.herokuapp.com';

  //endpoints
  static const String kAllQuestion = '/question/viewQuestions';
  static const String kTotalQuestion = '/question/totalQuestion';
  static const String kUserRegister = '/user/register';
  static const String kUserLogin = '/user/login';

  /*final Dio _dioObj = Dio(
    BaseOptions(
      // headers: const <String, String>{'X-Api-Key': "kApiKey"},

      ///token
      baseUrl: kBaseUrl,
    ),
  )
  ..interceptors.add(DioNetworkLogger());*/
  //client
  static ApiClientService client = ApiClientService(Dio(
    BaseOptions(
      headers: const <String, String>{
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      },

      ///token
      baseUrl: kBaseUrl,
    ),
  )..interceptors.add(DioNetworkLogger()));
}
