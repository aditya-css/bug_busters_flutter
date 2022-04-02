import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/colors.dart';

class CustomTextIconButtonWithoutBG extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final String icon;
  final bool flag;
  const CustomTextIconButtonWithoutBG({
    Key? key,
    required this.onPress,
    required this.title,
    required this.icon,
    this.flag = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPress,
      icon: SvgPicture.asset(
        icon,
        height: 22.0,
        color: flag ? AppColors.kWhite : AppColors.kCardBG,
      ),
      label: Text(
        title,
        style: TextStyle(
          color: flag ? AppColors.kWhite : AppColors.kCardBG,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
