// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthTextField extends StatelessWidget {
  final String? prefixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool obscureText;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  const AuthTextField({
    Key? key,
    this.prefixIcon,
    this.validator,
    this.controller,
    this.focusNode,
    this.obscureText = false,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.onFieldSubmitted,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: TextFormField(
        validator: validator,
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        obscureText: obscureText,
        decoration: InputDecoration(
            prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SvgPicture.asset(
            prefixIcon!,
            width: 30,
            height: 30,
          ),
        )),
      ),
    );
  }
}
