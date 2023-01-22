import 'package:flutter/material.dart';
import 'package:my_chat_app/res/app_constants.dart';

import 'social_box.dart';

class OrPortion extends StatelessWidget {
  const OrPortion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            children: const [
              Expanded(
                  child:
                      Divider(thickness: 1, color: AppConstants.primeryColor)),
              Text(" OR ", style: TextStyle(fontFamily: "Poppins")),
              Expanded(
                  child:
                      Divider(thickness: 1, color: AppConstants.primeryColor)),
            ],
          ),
        ),
        const Center(
          child: Text(
            "Sign up with email, Apple or Google",
            style: TextStyle(color: Colors.black54),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              SocialBox(assetPath: AppConstants.facebookSVGAsset),
              SocialBox(assetPath: AppConstants.googleSVGAsset),
              SocialBox(assetPath: AppConstants.gmailSVGAsset),
            ],
          ),
        )
      ],
    );
  }
}
