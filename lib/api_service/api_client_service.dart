import 'package:bug_busters_flutter/core/constants/resources.dart';
import 'package:bug_busters_flutter/models/que_ans_detail_model.dart';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../models/question_model.dart';

part 'api_client_service.g.dart';

@RestApi()
abstract class ApiClientService {
  factory ApiClientService(Dio dio) = _ApiClientService;

  @GET(ApiConst.kAllQuestion)
  Future<List<QuestionModel>> getAllQuestions();

  @GET(ApiConst.kTotalCount)
  Future<Map<String,int>> getTotalQues();

  @GET(ApiConst.kQueAnsDetail )
  Future<QueAnsDetailModel> getQueAnsDetails(@Path() String id);


// @POST(ApiConst.kUserLogin)
  // Future<TotalQuestion> loginUser(@Body() Map<String, dynamic> details);

}
