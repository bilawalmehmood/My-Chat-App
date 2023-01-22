// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialBox extends StatelessWidget {
  final String assetPath;
  const SocialBox({
    Key? key,
    required this.assetPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        icon: SvgPicture.asset(
          assetPath,
          height: 34,
          width: 34,
        ));
  }
}
