
import 'dart:io';


import 'package:bug_busters_flutter/api_service/api_client_service.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

class DataFetchRepositoryImpl{
  final ApiClientService _apiClientService;

  DataFetchRepositoryImpl({
    required ApiClientService apiClient,
  })  : _apiClientService = apiClient;


 /* @override
  Future<ResultState> getArticles() async {
    try {
      final HttpResponse<List<QuestionModel>> _response =
      await _apiClientService.getAllQuestions();
      if (_response.response.statusCode == HttpStatus.ok) {
        return Success<List<QuestionEntity>>(
          _response.data!,
        );
      }
      return Failure(
        ApiException(
          code: _response.response.statusCode!,
          message: _response.response.statusMessage!,
        ),
      );
    } on DioError catch (e) {
      throw Failure(
        ApiException(
          code: e.response?.statusCode,
          message: e.response?.statusMessage,
        ),
      );
    }
  }*/
}
