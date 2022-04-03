import 'package:flutter/material.dart';

class ResponsiveQuestion extends StatelessWidget {
  final Widget mobileView;
  final Widget desktopView;
  const ResponsiveQuestion({
    Key? key,
    required this.mobileView,
    required this.desktopView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 960) {
          return desktopView;
        }
        return mobileView;
      },
    );
  }
}
