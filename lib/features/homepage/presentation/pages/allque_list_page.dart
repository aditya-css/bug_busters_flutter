import 'package:bug_busters_flutter/features/homepage/presentation/widgets/center/question_list_item.dart';
import 'package:flutter/material.dart';

class AllQueListPage extends StatelessWidget {
  const AllQueListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 20,
        controller: ScrollController(),
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return const QuestionListItem();
        },
      ),
    );
  }
}
