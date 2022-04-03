import 'package:bug_busters_flutter/core/constants/resources.dart';
import 'package:bug_busters_flutter/core/widgets/custom_elevated_container.dart';
import 'package:flutter/material.dart';

import 'custom_divider.dart';
import 'custom_icon_text.dart';
import 'custom_text_num.dart';

class ReceiversView extends StatelessWidget {
  const ReceiversView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: CustomElevatedContainer(
        child: Column(
          children: [
            const CustomIconTextWidget(
              iconPath: AppAssets.kTrendingIcon,
              text: "Top Receivers",
            ),
            const CustomDivider(),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (_, index) => const CustomTextNumWidget(
                text: "Happy Makadiya",
                num: 100,
              ),
              separatorBuilder: (_, index) => const CustomDivider(),
              itemCount: 3,
            ),
          ],
        ),
      ),
    );
  }
}
