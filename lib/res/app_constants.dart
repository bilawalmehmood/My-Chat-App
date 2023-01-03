import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = "My Chat App";
  static const String animationMsgAsset = "assets/animation/chat.json";
  static const String riveChatAsset = "assets/rive/chatrive.riv";
  static const String chatSVGAsset = "assets/icons/chat.svg";
  static const String heartSVGAsset = "assets/icons/heart.svg";
  static const String circleSVGAsset = "assets/icons/circle.svg";

  static const Color primeryColor = Color(0xff105A5A);
  static const Color secondryColor = Color(0xff20CDCE);

  static const OutlineInputBorder defaultInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(
        color: Color(0xffdee3f2),
        width: 1,
      ));
}
