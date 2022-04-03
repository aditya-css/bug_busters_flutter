import 'package:bug_busters_flutter/core/constants/resources.dart';
import 'package:bug_busters_flutter/core/widgets/custom_elevated_container.dart';
import 'package:bug_busters_flutter/features/homepage/widgets/right/custom_icon_text.dart';
import 'package:flutter/material.dart';

import 'custom_divider.dart';
import 'custom_text_num.dart';

class StateView extends StatelessWidget {
  const StateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: CustomElevatedContainer(
        child: Column(
          children: [
            const CustomIconTextWidget(iconPath: AppAssets.kTrendingIcon, text: "State"),
           const CustomDivider(),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (_, index) => const CustomTextNumWidget(
                text: "Questions",
                num: 100,
              ),
              separatorBuilder: (_, index) => Divider(
                color: AppColors.kGrey.withOpacity(0.2),
                height: 30,
                indent: 8,
                endIndent: 8,
              ),
              itemCount: 3,
            ),
          ],
        ),
      ),
    );
  }
}
