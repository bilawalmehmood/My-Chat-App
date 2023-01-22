// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import 'package:my_chat_app/res/app_constants.dart';
import 'package:my_chat_app/screens/auth/components/auth_button.dart';
import 'package:my_chat_app/screens/auth/components/auth_text_field.dart';
import 'package:my_chat_app/screens/auth/components/custom_positioned.dart';
import 'package:my_chat_app/screens/auth/controllers/sign_up_controller.dart';

class SignUpForm extends StatelessWidget {
  final SignUpController controller;
  const SignUpForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "User Name",
                style: TextStyle(color: AppConstants.primeryColor),
              ),
              AuthTextField(
                validator: (value) => controller.validateUserName(value),
                prefixIcon: AppConstants.userSVGAsset,
                controller: controller.userNameController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
              const Text(
                "Email",
                style: TextStyle(color: AppConstants.primeryColor),
              ),
              AuthTextField(
                validator: (value) => controller.validateEmail(value),
                prefixIcon: AppConstants.emailSVGAsset,
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              const Text(
                "Password",
                style: TextStyle(color: AppConstants.primeryColor),
              ),
              AuthTextField(
                validator: (value) => controller.validatePassword(value),
                prefixIcon: AppConstants.passwordSVGAsset,
                obscureText: true,
                controller: controller.passwordController,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
              ),
              AuthButton(
                name: "Sign Up",
                icon: CupertinoIcons.arrow_right,
                onPressed: () {
                  if (controller.validateSignUp()) {
                    controller.signUp();
                  }
                },
              ),
            ],
          ),
        ),
        Obx(
          () => controller.isLoading.value
              ? CustomPositioned(
                  child: RiveAnimation.asset(
                    AppConstants.loadingRiveAsset,
                    onInit: controller.setCheckArtboard,
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
    ;
  }
}
