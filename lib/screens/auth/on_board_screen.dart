// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:my_chat_app/widgets/customs_widgets.dart';
import 'package:rive/rive.dart';
import 'package:my_chat_app/screens/auth/components/chat_about.dart';
import '../../res/app_constants.dart';

class OnBoardScreen extends StatefulWidget {
  static const String name = '/on_board_screen';
  const OnBoardScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _buttonAnimatedController;
  bool isAnimated = true;

  @override
  void initState() {
    super.initState();
    _buttonAnimatedController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const RiveAnimation.asset(AppConstants.chatRiveAsset),
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
                sigmaY: 8,
              ),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            top: isAnimated ? 0 : 50,
            child: const ChatAbout(),
          ),
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                if (isAnimated) {
                  _buttonAnimatedController.forward();
                  setState(() {
                    isAnimated = false;
                  });
                }
                Future.delayed(const Duration(seconds: 1), () {
                  loginDialogueBox(
                    context: context,
                    onChanged: (value) {
                      _buttonAnimatedController.reverse();
                      setState(() {
                        isAnimated = true;
                      });
                    },
                  );
                });
              },
              child: Lottie.asset(
                AppConstants.animationButtonAsset,
                height: 60,
                width: 100,
                controller: _buttonAnimatedController,
              ),
            ),
          )
        ],
      ),
    );
  }
}
