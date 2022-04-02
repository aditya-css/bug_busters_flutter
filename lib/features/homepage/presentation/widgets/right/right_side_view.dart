import 'package:bug_busters_flutter/features/homepage/presentation/widgets/right/add_que_button.dart';
import 'package:bug_busters_flutter/features/homepage/presentation/widgets/right/recievers_view.dart';
import 'package:bug_busters_flutter/features/homepage/presentation/widgets/right/state_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RightSideView extends StatelessWidget {
  const RightSideView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: size.width <= 1260
          ? const EdgeInsets.only(top: 50.0, left: 20, right: 20)
          : const EdgeInsets.only(top: 50.0, right: 20),
      child: Column(
        children: const [
          AddQuesButton(),
          StateView(),
          ReceiversView(),
        ],
      ),
    );
  }
}
