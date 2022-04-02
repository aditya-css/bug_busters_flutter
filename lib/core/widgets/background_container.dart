import 'package:flutter/material.dart';

import '../constants/colors.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  const BackgroundContainer({
    Key? key,
    required this.child,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.kCardBG,
        borderRadius: BorderRadius.circular(30.0),
      ),
      clipBehavior: Clip.hardEdge,
      child: child,
    );
  }
}
