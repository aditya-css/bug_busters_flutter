import 'package:bug_busters_flutter/features/homepage/mobx/all_question_store.dart';
import 'package:bug_busters_flutter/features/homepage/mobx/login_check_store.dart';
import 'package:bug_busters_flutter/features/profile/mobx/profile_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'features/homepage/mobx/left_side_menu_store.dart';
import 'features/homepage/mobx/login_check_store.dart';
import 'features/homepage/pages/home_page.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            Provider<LeftSideMenuStore>(
              create: (context) => LeftSideMenuStore(),
            ),
            Provider<ProfileStore>(
              create: ((context) => ProfileStore()),
            ),
            Provider<LoginCheckStore>(
              create: (context) => LoginCheckStore(),
            ),
            Provider<AllQuestionStore>(
              create: (context) => AllQuestionStore()..loadAllQuestion(),
            )
          ],
          child: const HomePage(),
        );
      },
    );
  }
}
