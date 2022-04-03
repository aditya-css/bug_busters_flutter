import 'package:bug_busters_flutter/core/constants/resources.dart';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/question_model.dart';

part 'api_client_service.g.dart';

@RestApi()
abstract class ApiClientService {
  factory ApiClientService(Dio dio) = _ApiClientService;

  @GET(ApiConst.kAllQuestion)
  Future<HttpResponse<List<QuestionModel>>> getAllQuestions();
}