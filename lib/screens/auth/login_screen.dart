import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_chat_app/screens/auth/components/chat_about.dart';
import 'package:rive/rive.dart';

import '../../res/app_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const RiveAnimation.asset(AppConstants.riveChatAsset),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 15,
              ),
              child: const SizedBox(),
            ),
          ),
          Positioned(
            top: 110,
            left: 50,
            child: SvgPicture.asset(
              AppConstants.heartSVGAsset,
              width: 120,
              height: 120,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SvgPicture.asset(
              AppConstants.chatSVGAsset,
              width: 130,
              height: 130,
            ),
          ),
          Positioned(
            top: 12,
            right: 35,
            child: SvgPicture.asset(
              AppConstants.chatSVGAsset,
              width: 130,
              height: 130,
            ),
          ),
          Positioned(
            bottom: 5,
            right: 40,
            child: SvgPicture.asset(
              AppConstants.circleSVGAsset,
              width: 120,
              height: 120,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 10,
              ),
              child: const SizedBox(),
            ),
          ),
          const ChatAbout(),
        ],
      ),
    );
  }
}
