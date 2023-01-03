import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat_app/res/app_constants.dart';
import 'package:my_chat_app/screens/start/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        theme: ThemeData(
            scaffoldBackgroundColor: AppConstants.secondryColor,
            primarySwatch: Colors.blue,
            fontFamily: "Intel",
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: Colors.white,
              errorStyle: TextStyle(height: 0),
              border: AppConstants.defaultInputBorder,
              errorBorder: AppConstants.defaultInputBorder,
              focusedBorder: AppConstants.defaultInputBorder,
              enabledBorder: AppConstants.defaultInputBorder,
            )),
        home: const SplashScreen());
  }
}
