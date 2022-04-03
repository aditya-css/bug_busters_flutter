import 'package:bug_busters_flutter/core/constants/colors.dart';
import 'package:bug_busters_flutter/core/constants/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../profile/pages/swap_token_view.dart';
import '../mobx/left_side_menu_store.dart';
import '../widgets/left/left_side_menu.dart';
import '../widgets/right/right_side_view.dart';
import '../widgets/top/appbar.dart';
import 'body_container_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      final size = MediaQuery.of(context).size;
      return Scaffold(
        backgroundColor: AppColors.kWhite,
        appBar: AppBar(
          backgroundColor: AppColors.kWhite,
          toolbarHeight: 70,
          elevation: 14,
          shadowColor: AppColors.kGrey.withOpacity(0.2),
          title: CustomAppBar(),
        ),
        body: SafeArea(
          child: Observer(builder: (context) {
            final store = Provider.of<LeftSideMenuStore>(context);
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const LeftSideMenu(),
                        if (size.width <= 1260 && store.selectedItem != 3)
                          const RightSideView(),
                        if (size.width <= 1260 && store.selectedItem == 3)
                          SwapTokenView(),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  flex: 3,
                  child: BodyContainerPage(),
                ),
                if (size.width > 1260)
                  Expanded(
                    flex: 1,
                    child: store.selectedItem == 3
                        ? SwapTokenView()
                        : const RightSideView(),
                  ),
              ],
            );
          }),
        ),
      );
    });
  }
}
