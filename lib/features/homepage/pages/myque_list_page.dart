import 'package:flutter/material.dart';

import '../widgets/center/question_list_item.dart';

class MyQueListPage extends StatelessWidget {
  const MyQueListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: ListView.builder(
      //   itemCount: 1,
      //   controller: ScrollController(),
      //   physics: const BouncingScrollPhysics(),
      //   itemBuilder: (context, index) {
      //     return const QuestionListItem();
      //   },
      // ),
    );
  }
}
