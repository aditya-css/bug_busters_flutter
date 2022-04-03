import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'custom_text_icon_button_without_bg.dart';

class CounterButton extends StatelessWidget {
  final VoidCallback increment;
  final VoidCallback decrement;
  final VoidCallback award;

  const CounterButton({
    Key? key,
    required this.increment,
    required this.decrement,
    required this.award,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: increment,
          child: const Icon(
            Icons.arrow_upward_rounded,
            color: AppColors.kWhite,
          ),
        ),
        const SizedBox(width: 14.0),
        const Text(
          '30',
          style: TextStyle(
            color: AppColors.kWhite,
          ),
        ),
        const SizedBox(width: 14.0),
        InkWell(
          onTap: decrement,
          child: const Icon(
            Icons.arrow_downward_rounded,
            color: AppColors.kWhite,
          ),
        ),
        const SizedBox(width: 14.0),
        CustomTextIconButtonWithoutBG(
          onPress: award,
          title: 'Award',
          icon: 'assets/gift.svg',
          flag: true,
        ),
      ],
    );
  }
}
