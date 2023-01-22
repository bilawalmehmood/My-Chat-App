import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat_app/screens/auth/components/sign_up_form.dart';
import 'package:my_chat_app/screens/auth/controllers/sign_up_controller.dart';

class SignUpScreen extends GetView<SignUpController> {
  static const String name = '/sign_up_screen';
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 35, fontFamily: "Poppins"),
              ),
              const SizedBox(height: 30),
              SignUpForm(controller: controller),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
