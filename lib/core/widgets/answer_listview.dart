import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'answer_counter_button.dart';
import 'answer_header.dart';

class AnsListView extends StatelessWidget {
  const AnsListView({
    Key? key,
    required this.child,
    this.width,
    this.height,
    this.physics,
  }) : super(key: key);

  final Widget child;
  final double? width;
  final double? height;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        physics: physics,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(40.0),
            margin: const EdgeInsets.fromLTRB(20.0, 20.0, 30.0, 0.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: AppColors.kGrey.withOpacity(0.2),
                  blurRadius: 10,
                ),
              ],
            ),
            child: child,
          );
        },
      ),
    );
  }
}
List<Widget> data =[
  Column(
    children: [
      const AnswerHeader(
        description:
        'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.',
        imageUrl:
        'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        userName: 'Happy Makadiya',
        time: '02/04/2022 3:30:12 PM',
      ),
      const SizedBox(height: 20.0),
      AnsCounterButton(
        award: () {},
        increment: () {},
        decrement: () {},
        flag: true,
      ),
    ],
  ),
  Column(
    children: [
      const AnswerHeader(
        description:
        'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
        imageUrl:
        'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        userName: 'Aditya',
        time: '02/04/2022 3:30:12 PM',
      ),
      const SizedBox(height: 20.0),
      AnsCounterButton(
        award: () {},
        increment: () {},
        decrement: () {},
        flag: true,
      ),
    ],
  ),
  Column(
    children: [
      const AnswerHeader(
        description:
        'letters, as opposed to using \'Content here, content here\', making it look like readable English.',
        imageUrl:
        'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        userName: 'Manoj',
        time: '02/04/2022 3:30:12 PM',
      ),
      const SizedBox(height: 20.0),
      AnsCounterButton(
        award: () {},
        increment: () {},
        decrement: () {},
        flag: true,
      ),
    ],
  )
];