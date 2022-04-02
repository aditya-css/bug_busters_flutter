import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomTextIconButton extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final Widget icon;
  final bool flag;
  const CustomTextIconButton({
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
      style: TextButton.styleFrom(
        backgroundColor: flag ? AppColors.kCardBG : AppColors.kWhite,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      icon: icon,
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
