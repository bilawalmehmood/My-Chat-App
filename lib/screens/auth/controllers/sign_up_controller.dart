import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat_app/enum/snack_bar_message.dart';
import 'package:my_chat_app/models/user_model.dart';
import 'package:my_chat_app/screens/home/home_screen.dart';
import 'package:my_chat_app/services/firebase/auth_services.dart';
import 'package:my_chat_app/services/firebase/user_services.dart';
import 'package:rive/rive.dart';

import '../../../widgets/customs_widgets.dart';

class SignUpController extends GetxController {
  late final TextEditingController userNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  late final FocusNode emailFocusNode;
  late final FocusNode passwordFocusNode;
  late final GlobalKey<FormState> formKey;

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;
  late SMITrigger confetti;

  RxBool isLoading = false.obs;
  RxBool isConfetti = false.obs;

  @override
  void onInit() {
    super.onInit();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    formKey = GlobalKey<FormState>();
  }

  @override
  void onClose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    super.onClose();
  }

  void setCheckArtboard(Artboard artboard) {
    StateMachineController stateMachineController;
    stateMachineController = StateMachineController.fromArtboard(
      artboard,
      'State Machine 1',
    )!;
    artboard.addController(stateMachineController);
    check = stateMachineController.findSMI('Check') as SMITrigger;
    error = stateMachineController.findSMI('Error') as SMITrigger;
    reset = stateMachineController.findSMI('Reset') as SMITrigger;
  }

  void setConfettiArtboard(Artboard artboard) {
    StateMachineController stateMachineController;
    stateMachineController = StateMachineController.fromArtboard(
      artboard,
      'State Machine 1',
    )!;
    artboard.addController(stateMachineController);
    confetti =
        stateMachineController.findSMI('Trigger explosion') as SMITrigger;
  }

  void signUp() async {
    try {
      isLoading(true);
      User? user = await AuthService.signUp(
        emailController.text.trim(),
        passwordController.text,
      );
      if (user != null) {
        UserModel userModel = UserModel(
          uid: user.uid,
          userName: userNameController.text.trim(),
          nameToSearch: userNameController.text.trim().toLowerCase(),
          email: emailController.text.trim(),
          profileUrl: "",
          isOnline: true,
          groupId: <String>[],
        );

        await UserServices.createUser(userModel);

        check.fire();
        Future.delayed(const Duration(seconds: 3), () {
          isLoading(false);
          Get.offAllNamed(HomeScreen.name);
          showSnackbar(SnackbarMessage.success, "Sign Up Success");
        });
      } else {
        error.fire();
        Future.delayed(const Duration(seconds: 3), () {
          isLoading(false);
        });
      }
    } on FirebaseAuthException catch (e) {
      error.fire();
      Future.delayed(const Duration(seconds: 3), () {
        isLoading(false);
        showSnackbar(SnackbarMessage.error, e.message ?? e.toString());
      });
    } on FirebaseException catch (e) {
      error.fire();
      Future.delayed(const Duration(seconds: 3), () {
        isLoading(false);
        showSnackbar(SnackbarMessage.error, e.message ?? e.toString());
      });
    } catch (e) {
      error.fire();
      Future.delayed(const Duration(seconds: 3), () {
        isLoading(false);
        showSnackbar(SnackbarMessage.error, e.toString());
      });
    }
  }

  String? validateUserName(String? value) {
    if (value!.isEmpty) {
      return "User Name is required";
    } else if (value.length < 3) {
      return "User Name must be at least 3 characters";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Email is required";
    } else if (!GetUtils.isEmail(value)) {
      return "Email is not valid";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Password is required";
    } else if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  bool validateSignUp() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void clearSignInController() {
    emailController.clear();
    passwordController.clear();
  }
}
