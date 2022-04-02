import 'package:bug_busters_flutter/core/constants/resources.dart';
import 'package:flutter/material.dart';

class CustomElevatedContainer extends StatelessWidget {
  final Widget child;
  const CustomElevatedContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.kGrey.withOpacity(0.2),
            blurRadius: 14,
          ),
        ],
      ),
      child: child,
    );
  }
}
