import 'package:bug_busters_flutter/features/profile/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../mobx/profile_store.dart';

class ProfileMenu extends StatelessObserverWidget {
  const ProfileMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<ProfileStore>(context);
    return ListView(
      children: [
        ProfileMenuItem(
          isSelected: store.selectedIndex == 0 ? true : false,
          onPressed: () => store.changeIndex(0),
          title: "Edit",
          icon: Icons.edit,
        ),
        ProfileMenuItem(
          isSelected: store.selectedIndex == 1 ? true : false,
          onPressed: () => store.changeIndex(1),
          title: "Notification",
          icon: Icons.notifications,
        ),
      ],
    );
  }
}
