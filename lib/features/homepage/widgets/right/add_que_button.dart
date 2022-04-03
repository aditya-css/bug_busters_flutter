import 'package:bug_busters_flutter/core/constants/resources.dart';
import 'package:flutter/material.dart';

class AddQuesButton extends StatelessWidget {
  const AddQuesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: AppColors.kPrimary,
        elevation: 0,
        minimumSize: const Size(280,50),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      icon: const FittedBox(
        child: Icon(
          Icons.add,
          size: 16,
          color: AppColors.kWhite,
        ),
      ),
      label: const FittedBox(
        child: Text(
          "Add Question",
          style: TextStyle(
            color: AppColors.kWhite,
          ),
        ),
      ),
    );
  }
}
