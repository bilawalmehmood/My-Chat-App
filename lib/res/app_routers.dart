import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat_app/screens/auth/on_board_screen.dart';
import 'package:my_chat_app/screens/auth/sign_in_screen.dart';
import 'package:my_chat_app/screens/home/home_screen.dart';
import 'package:my_chat_app/screens/start/splash_screen.dart';

@immutable
abstract class AppRouter {
  static List<GetPage> getAppPages() => <GetPage>[
        GetPage(
          name: SplashScreen.name,
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: OnBoardScreen.name,
          page: () => const OnBoardScreen(),
        ),
        GetPage(
          name: SigninScreen.name,
          page: () => const SigninScreen(),
        ),
        GetPage(
          name: HomeScreen.name,
          page: () => const HomeScreen(),
        ),
      ];
}
