import 'package:bug_busters_flutter/features/homepage/mobx/all_question_store.dart';
import 'package:bug_busters_flutter/features/homepage/widgets/center/question_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class AllQueListPage extends StatelessObserverWidget {
  const AllQueListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final store = context.read<AllQuestionStore>();
    if (store.questionResponseFuture.status == FutureStatus.pending) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (store.hasResult) {
      return Center(
        child: ListView.builder(
          itemCount: store.repositories.length,
          controller: ScrollController(),
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return QuestionListItem(queModel: store.repositories[index]);
          },
        ),
      );
    } else {
      return Text(store.questionResponseFuture.result);
    }
  }
}
