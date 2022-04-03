import 'package:bug_busters_flutter/core/constants/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LeftSideMenuItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final bool isSelected;
  final VoidCallback onPressed;
  const LeftSideMenuItem({
    Key? key,
    required this.isSelected,
    required this.onPressed,
    required this.title,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ColoredBox(
        color: isSelected
            ? AppColors.kPrimary.withOpacity(0.1)
            : Colors.transparent,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          minLeadingWidth: 14,
          onTap: onPressed,
          leading: Container(
            width: isSelected ? 10 : 0,
            color: AppColors.kPrimary,
          ),
          title: Row(
            children: [
              SvgPicture.asset(
                iconPath,
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(title),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
