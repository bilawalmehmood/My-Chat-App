import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat_app/screens/auth/components/or_portion.dart';
import 'package:my_chat_app/screens/auth/components/sign_in_form.dart';
import 'package:my_chat_app/screens/auth/controllers/sign_in_controller.dart';

class SigninScreen extends GetView<SignInController> {
  static const String name = '/sign_in_screen';
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignInController());
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Login",
                style: TextStyle(fontSize: 35, fontFamily: "Poppins"),
              ),
              const SizedBox(height: 30),
              SigninForm(
                controller: controller,
              ),
              const OrPortion(),
            ],
          ),
        ),
      ),
    );
  }
}
