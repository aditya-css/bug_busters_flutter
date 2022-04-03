import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconTextWidget extends StatelessWidget {
  final String iconPath;
  final String text;
  const CustomIconTextWidget({
    Key? key,
    required this.iconPath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          width: 20,
          height: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }
}
