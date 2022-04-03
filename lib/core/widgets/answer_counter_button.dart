import 'package:flutter/material.dart';

import 'custom_text_icon_button_without_bg.dart';

class AnsCounterButton extends StatelessWidget {
  final VoidCallback increment;
  final VoidCallback decrement;
  final VoidCallback award;
  final bool flag;
  const AnsCounterButton({
    Key? key,
    required this.increment,
    required this.decrement,
    required this.award,
    this.flag = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: increment,
          child: const Icon(
            Icons.arrow_upward_rounded,
            color: Colors.grey,
          ),
        ),
        SizedBox(width: flag ? 10.0 : 14.0),
        const Text('30'),
        SizedBox(width: flag ? 10.0 : 14.0),
        InkWell(
          onTap: decrement,
          child: const Icon(
            Icons.arrow_downward_rounded,
            color: Colors.grey,
          ),
        ),
        SizedBox(width: flag ? 10.0 : 14.0),
        CustomTextIconButtonWithoutBG(
          onPress: award,
          title: 'Award',
          icon: 'assets/gift.svg',
        ),
      ],
    );
  }
}
