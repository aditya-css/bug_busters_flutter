import 'package:bug_busters_flutter/core/constants/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../mobx/left_side_menu_store.dart';
import 'left_side_menu_item.dart';

class LeftSideMenu extends StatelessObserverWidget {
  const LeftSideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<LeftSideMenuStore>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          LeftSideMenuItem(
            isSelected: store.selectedItem == 0 ? true : false,
            onPressed: () => store.changeIndex(0),
            title: AppStrings.kHomeIconText,
            iconPath: AppAssets.kHomeIcon,
          ),
          LeftSideMenuItem(
            isSelected: store.selectedItem == 1 ? true : false,
            onPressed: () => store.changeIndex(1),
            title: AppStrings.kMyQueIconText,
            iconPath: AppAssets.kQuesIcon,
          ),
          LeftSideMenuItem(
            isSelected: store.selectedItem == 2 ? true : false,
            onPressed: () => store.changeIndex(2),
            title: AppStrings.kMyAnsIconText,
            iconPath: AppAssets.kAnsIcon,
          ),
          LeftSideMenuItem(
            isSelected: store.selectedItem == 3 ? true : false,
            onPressed: () => store.changeIndex(3),
            title: AppStrings.kProfileSettingText,
            iconPath: AppAssets.kProfileIcon,
          )
        ],
      ),
    );
  }
}
