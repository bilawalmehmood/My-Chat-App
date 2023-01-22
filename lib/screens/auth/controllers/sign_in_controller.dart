import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat_app/screens/home/home_screen.dart';
import 'package:rive/rive.dart';

class SignInController extends GetxController {
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
    emailController = TextEditingController();
    passwordController = TextEditingController();

    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    formKey = GlobalKey<FormState>();
  }

  @override
  void onClose() {
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

  void signIn() {
    isLoading.value = true;
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (formKey.currentState!.validate()) {
          check.fire();
          Future.delayed(const Duration(seconds: 3), () {
            isLoading(false);
            Get.offAndToNamed(HomeScreen.name);
          });
        } else {
          error.fire();
          Future.delayed(const Duration(seconds: 3), () {
            isLoading(false);
          });
        }
      },
    );
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

  void clearSignInController() {
    emailController.clear();
    passwordController.clear();
  }
}
