import 'package:bug_busters_flutter/core/constants/colors.dart';
import 'package:bug_busters_flutter/core/constants/resources.dart';
import 'package:bug_busters_flutter/features/homepage/presentation/pages/body_container_page.dart';
import 'package:bug_busters_flutter/features/homepage/presentation/widgets/left/left_side_menu.dart';
import 'package:bug_busters_flutter/features/homepage/presentation/widgets/right/right_side_view.dart';
import 'package:bug_busters_flutter/features/homepage/presentation/widgets/top/appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const LeftSideMenu(),
                      if (size.width <= 1260) const RightSideView(),
                    ],
                  ),
                ),
              ),
              const Expanded(
                flex: 3,
                child: BodyContainerPage(),
              ),
              if (size.width > 1260)
                const Expanded(
                  flex: 1,
                  child: RightSideView(),
                ),
            ],
          ),
        ),
      );
    });
  }
}
