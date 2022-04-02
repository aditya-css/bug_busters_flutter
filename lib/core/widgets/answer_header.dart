import 'package:flutter/material.dart';

class AnswerHeader extends StatelessWidget {
  final String description;
  final String imageUrl;
  final String userName;
  final String time;

  const AnswerHeader({
    Key? key,
    required this.description,
    required this.imageUrl,
    required this.userName,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                imageUrl,
              ),
              radius: 26.0,
            ),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  time,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            description,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
