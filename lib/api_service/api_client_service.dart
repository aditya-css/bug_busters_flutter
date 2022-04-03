import 'package:bug_busters_flutter/core/constants/resources.dart';
import 'package:bug_busters_flutter/models/login_request_model.dart';
import 'package:bug_busters_flutter/models/login_response_model.dart';
import 'package:bug_busters_flutter/models/user_model.dart';
import 'package:bug_busters_flutter/models/user_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/question_model.dart';
import '../models/total_question_model.dart';

part 'api_client_service.g.dart';

@RestApi()
abstract class ApiClientService {
  factory ApiClientService(Dio dio) = _ApiClientService;

  @GET(ApiConst.kAllQuestion)
  Future<List<QuestionModel>> getAllQuestions();

  @GET(ApiConst.kTotalQuestion)
  Future<TotalQuestion> getTotalQuestions();

  @POST(ApiConst.kUserRegister)
  Future<HttpResponse<UserResponseModel>> registerUser(@Body() UserModel user);

  @POST(ApiConst.kUserLogin)
  Future<HttpResponse<LoginResponse>> loginUser(@Body() LoginRequest details);
}
