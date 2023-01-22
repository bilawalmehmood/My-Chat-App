// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomPositioned extends StatelessWidget {
  final double size;
  final Widget child;
  const CustomPositioned({
    Key? key,
    this.size = 80,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 75,
      left: 140,
      child: SizedBox(
        height: size,
        width: size,
        child: child,
      ),
    );
    ;
  }
}
