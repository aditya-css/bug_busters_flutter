import 'package:bug_busters_flutter/features/homepage/presentation/mobx/left_side_menu_store.dart';
import 'package:bug_busters_flutter/features/homepage/presentation/pages/allque_list_page.dart';
import 'package:bug_busters_flutter/features/homepage/presentation/pages/myans_list_page.dart';
import 'package:bug_busters_flutter/features/homepage/presentation/pages/myque_list_page.dart';
import 'package:bug_busters_flutter/features/profile/presentation/pages/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class BodyContainerPage extends StatelessObserverWidget {
  const BodyContainerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<LeftSideMenuStore>(context);
    switch (store.selectedItem) {
      case 0:
         return const AllQueListPage();
      case 1:
        return const MyQueListPage();
      case 2:
        return const MyAnsListPage();
      case 3:
        return const EditProfile();
      default:
        return const Text("Error");
    }

  }
}
