import 'package:flutter/material.dart';

import '../constants/colors.dart';

class QuestionHeader extends StatelessWidget {
  final String question;
  final String imageUrl;
  final String userName;
  final String description;

  const QuestionHeader({
    Key? key,
    required this.question,
    required this.imageUrl,
    required this.description,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          question,
          style: const TextStyle(
            fontSize: 30.0,
            color: AppColors.kWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20.0),
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                imageUrl,
              ),
              radius: 24.0,
            ),
            const SizedBox(width: 20.0),
            Text(
              userName,
              style: const TextStyle(
                fontSize: 18.0,
                color: AppColors.kWhite,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        Text(
          description,
          style: const TextStyle(
            color: AppColors.kWhite,
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            height: 2,
          ),
        ),
      ],
    );
  }
}
