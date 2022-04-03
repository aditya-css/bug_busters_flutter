import 'package:bug_busters_flutter/core/constants/resources.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onPressed;
  final IconData icon;
  const ProfileMenuItem({
    Key? key,
    required this.isSelected,
    required this.onPressed,
    required this.title,
    required this.icon,
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
              Icon(icon),
              const SizedBox(width: 10),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
