import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = "My Chat App";
  static const String animationMsgAsset = "assets/animation/chat.json";
  static const String animationButtonAsset =
      "assets/animation/animated_button.json";

  static const String chatRiveAsset = "assets/rive/chatrive.riv";
  static const String loadingRiveAsset = "assets/rive/checkerror.riv";
  static const String confettiRiveAsset = "assets/rive/confetti.riv";
  static const String doneRiveAsset = "assets/rive/done.riv";

  static const String chatSVGAsset = "assets/icons/chat.svg";
  static const String heartSVGAsset = "assets/icons/heart.svg";
  static const String circleSVGAsset = "assets/icons/circle.svg";
  static const String emailSVGAsset = "assets/icons/email.svg";
  static const String facebookSVGAsset = "assets/icons/facebook.svg";
  static const String gmailSVGAsset = "assets/icons/gmail.svg";
  static const String googleSVGAsset = "assets/icons/google.svg";
  static const String passwordSVGAsset = "assets/icons/password.svg";
  static const String closeSVGAsset = "assets/icons/close.svg";
  static const String userSVGAsset = "assets/icons/user.png";

  static const Color primeryColor = Color(0xff105A5A);
  static const Color secondryColor = Color(0xff20CDCE);
  static const Color dialoguTextColor = Colors.white;

  static const Color errorColor = Color(0xffFF0000);
  static const Color successColor = Color(0xff00FF00);
  static const Color missingColor = Color(0xffFFA500);

  //Firesotre Collections
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference usersCollection = firestore.collection("users");
  static CollectionReference messagesCollection =
      firestore.collection("messages");
  static CollectionReference chatsCollection = firestore.collection("chats");

  static const OutlineInputBorder defaultInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(
        color: Color(0xffdee3f2),
        width: 1,
      ));
}
