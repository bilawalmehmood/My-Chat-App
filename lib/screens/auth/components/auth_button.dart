// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:my_chat_app/res/app_constants.dart';

class AuthButton extends StatelessWidget {
  final String name;
  final IconData icon;
  final VoidCallback onPressed;
  const AuthButton({
    Key? key,
    required this.name,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        label: Text(name),
        icon: Icon(
          icon,
          color: AppConstants.secondryColor,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppConstants.primeryColor,
          minimumSize: const Size(double.infinity, 56),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
        ),
      ),
    );
  }
}
