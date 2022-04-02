import 'package:bug_busters_flutter/features/homepage/presentation/widgets/center/question_list_item.dart';
import 'package:flutter/material.dart';

class MyQueListPage extends StatelessWidget {
  const MyQueListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 1,
        controller: ScrollController(),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return const QuestionListItem();
        },
      ),
    );
  }
}
