import 'package:bug_busters_flutter/features/homepage/presentation/mobx/left_side_menu_store.dart';
import 'package:bug_busters_flutter/features/homepage/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

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
