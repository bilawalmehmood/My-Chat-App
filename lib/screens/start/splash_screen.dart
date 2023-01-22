import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_chat_app/res/app_constants.dart';
import 'package:my_chat_app/screens/auth/on_board_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String name = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () async {
      Get.offAllNamed(OnBoardScreen.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.secondryColor,
      primary: true,
      body: Stack(
        children: [
          Center(
            child: Lottie.asset(AppConstants.animationMsgAsset),
          ),
          Positioned(
              height: 200,
              width: 400,
              top: Get.height / 3.6,
              left: 110,
              child: const Text(
                AppConstants.appName,
                style: TextStyle(
                  color: AppConstants.primeryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      ),
    );
  }
}
