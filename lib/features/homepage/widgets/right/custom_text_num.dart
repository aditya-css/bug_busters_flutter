import 'package:flutter/material.dart';

class CustomTextNumWidget extends StatelessWidget {
  final String text;
  final int num;
  const CustomTextNumWidget({
    Key? key,
    required this.text,
    required this.num,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )),
        Text(num.toString()),
      ],
    );
  }
}
