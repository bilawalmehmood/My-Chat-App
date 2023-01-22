import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat_app/enum/snack_bar_message.dart';
import 'package:my_chat_app/res/app_constants.dart';
import 'package:my_chat_app/screens/auth/components/moving_screen_widget.dart';
import 'package:my_chat_app/screens/auth/sign_in_screen.dart';
import 'package:my_chat_app/screens/auth/sign_up_screen.dart';

void loginDialogueBox({
  required BuildContext context,
  required ValueChanged onChanged,
}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Sign In",
    barrierDismissible: true,
    transitionDuration: const Duration(milliseconds: 500),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      Tween<Offset> tween;
      tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        ),
        child: child,
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) => MovingScreenWidget(
      frontPage: myContainer(child: const SigninScreen()),
      backPage: myContainer(child: const SignUpScreen()),
    ),
  ).then(onChanged);
}

Widget myContainer({
  required Widget child,
}) {
  return Center(
    child: Container(
      height: 550,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppConstants.dialoguTextColor.withOpacity(0.85),
        borderRadius: BorderRadius.circular(50),
      ),
      child: child,
    ),
  );
}

Widget circularProgress({Color color = const Color(0xff00A86B)}) {
  return CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(color),
  );
}

void showSnackbar(SnackbarMessage messageType, String message) {
  Get.snackbar(
    messageType == SnackbarMessage.error
        ? "Error"
        : messageType == SnackbarMessage.success
            ? 'Success'
            : 'Missing',
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: messageType == SnackbarMessage.error
        ? Colors.redAccent
        : messageType == SnackbarMessage.success
            ? Colors.green
            : Colors.orangeAccent,
    colorText: AppConstants.dialoguTextColor,
  );
}
