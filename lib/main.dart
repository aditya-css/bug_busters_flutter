import 'package:bug_busters_flutter/core/constants/resources.dart';
import 'package:bug_busters_flutter/features/login/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade600,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.kPrimary),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.kPrimary),
            borderRadius: BorderRadius.circular(4),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
