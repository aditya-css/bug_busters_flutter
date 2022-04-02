import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AnsListView extends StatelessWidget {
  const AnsListView({
    Key? key,
    required this.child,
    this.width,
    this.height,
    this.physics,
  }) : super(key: key);

  final Widget child;
  final double? width;
  final double? height;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        physics: physics,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(40.0),
            margin: const EdgeInsets.fromLTRB(20.0, 20.0, 30.0, 0.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: AppColors.kGrey.withOpacity(0.2),
                  blurRadius: 10,
                ),
              ],
            ),
            child: child,
          );
        },
      ),
    );
  }
}
