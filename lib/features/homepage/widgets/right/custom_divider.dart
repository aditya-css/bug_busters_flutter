import 'package:bug_busters_flutter/core/constants/resources.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Divider(
      color: AppColors.kGrey.withOpacity(0.2),
      height: 30,
      indent: 8,
      endIndent: 8,
    );
  }
}
