
import 'package:bug_busters_flutter/api_service/api_client_service.dart';
import 'package:dio/dio.dart';

class ApiConst {
  //base
  static const String kBaseUrl = 'https://metastack.herokuapp.com/';

  //endpoints
  static const String kAllQuestion = '/question/viewQuestions';

  //client
  static ApiClientService client = ApiClientService(
    Dio(
      BaseOptions(
        headers: const <String, String>{'X-Api-Key': "kApiKey"}, ///token
        baseUrl: kBaseUrl,
      ),
    ),
  );

}
