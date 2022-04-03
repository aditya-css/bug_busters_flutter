import 'package:bug_busters_flutter/api_service/repositories/api_repo.dart';
import 'package:bug_busters_flutter/models/question_model.dart';
import 'package:mobx/mobx.dart';

part 'all_question_store.g.dart';

class AllQuestionStore = _AllQuestionStore with _$AllQuestionStore;

abstract class _AllQuestionStore with Store {
  ObservableList<QuestionModel> repositories = <QuestionModel>[].asObservable();

  @computed
  bool get hasResult =>
      questionResponseFuture != emptyResponse &&
      questionResponseFuture.status == FutureStatus.fulfilled;

  ObservableFuture<List<QuestionModel>> questionResponseFuture = emptyResponse;

  static ObservableFuture<List<QuestionModel>> emptyResponse =
      ObservableFuture.value([]);

  Future loadAllQuestion() async {
    questionResponseFuture = ObservableFuture(ApiRepo.getAllQuestions());
    return repositories = ObservableList.of(await questionResponseFuture);
  }
}
