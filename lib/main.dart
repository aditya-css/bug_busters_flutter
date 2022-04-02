import 'package:bug_busters_flutter/features/profile/presentation/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/profile/presentation/mobx/profile_store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => ProfileStore(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Profile(),
      ),
    );
  }
}
