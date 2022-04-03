import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'features/homepage/mobx/left_side_menu_store.dart';
import 'features/homepage/pages/home_page.dart';

void main() {
  runApp(
    const MaterialApp(home: MyApp()),
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
          ],
          child: HomePage(),
        );
      },
    );
  }
}
