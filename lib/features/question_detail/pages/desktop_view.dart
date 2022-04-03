import 'package:bug_busters_flutter/core/widgets/answer_listview.dart';
import 'package:bug_busters_flutter/core/widgets/background_container.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/answer_counter_button.dart';
import '../../../../core/widgets/answer_header.dart';
import '../../../../core/widgets/counter_button.dart';
import '../../../../core/widgets/custom_clip.dart';
import '../../../../core/widgets/custom_text_icon_button.dart';
import '../../../../core/widgets/question_header.dart';

class DesktopView extends StatelessWidget {
  final VoidCallback addAnswer;

  const DesktopView({
    Key? key,
    required this.addAnswer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        BackgroundContainer(
          width: size.width * .35 - 30,
          height: size.height,
          child: Stack(
            children: [
              CustomClip(
                height: 20.h,
                file: 'assets/bgClip1.svg',
                width: 20.w,
                top: 10.h,
                left: 0,
              ),
              CustomClip(
                height: 20.h,
                file: 'assets/bgClip2.svg',
                width: 20.w,
                bottom: 0,
                right: 0,
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * .65,
                      child: const SingleChildScrollView(
                        child: QuestionHeader(
                          question: 'I got a 200 on the boards, You can get better.',
                          imageUrl:
                              'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                          description:
                              'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth. \nThe master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. ',
                          userName: 'Tom Cruse',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color: AppColors.kCardDarkBG,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: CounterButton(
                        increment: () {},
                        decrement: () {},
                        award: () {},
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextIconButton(
                      title: 'Add an answer',
                      onPress: addAnswer,
                      icon: const Icon(
                        Icons.add,
                        color: AppColors.kCardBG,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20.0),
        AnsListView(
          height: size.height,
          width: size.width * .65 - 30,
          child: Column(
            children: [
              const AnswerHeader(
                description:
                    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.',
                imageUrl:
                    'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                userName: 'Tom Cruse',
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
        ),
      ],
    );
  }
}
