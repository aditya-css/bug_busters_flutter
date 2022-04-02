import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomClip extends StatelessWidget {
  final String file;
  final double? top;
  final double? left;
  final double? bottom;
  final double? right;
  final double? width;
  final double? height;

  const CustomClip({
    Key? key,
    required this.file,
    this.top,
    this.left,
    this.right,
    this.width,
    this.height,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      bottom: bottom,
      right: right,
      child: Opacity(
        opacity: .7,
        child: SvgPicture.asset(
          file,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
