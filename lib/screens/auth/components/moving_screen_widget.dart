// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

class MovingScreenWidget extends StatefulWidget {
  final Widget frontPage;
  final Widget backPage;
  const MovingScreenWidget({
    Key? key,
    required this.frontPage,
    required this.backPage,
  }) : super(key: key);

  @override
  State<MovingScreenWidget> createState() => _MovingScreenWidgetState();
}

class _MovingScreenWidgetState extends State<MovingScreenWidget>
    with TickerProviderStateMixin {
  late final AnimationController moveController;
  Animation<double>? animation;
  bool isFront = true;
  double verticalDrag = 0;
  @override
  void initState() {
    super.initState();

    moveController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    moveController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onVerticalDragStart: (details) {
          moveController.reset();
          setState(() {});
        },
        onVerticalDragUpdate: (details) {
          setState(() {
            verticalDrag += details.delta.dy;
            verticalDrag %= 360;
          });
          setPageSide();
        },
        onVerticalDragEnd: (details) {
          final double end = 360 - verticalDrag >= 180 ? 0 : 360;
          animation = Tween<double>(begin: verticalDrag, end: end)
              .animate(moveController)
            ..addListener(() {
              setState(() {
                verticalDrag = animation!.value;
              });
            });
          moveController.forward();
        },
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX((verticalDrag) / 180 * pi),
          alignment: Alignment.center,
          child: isFront
              ? widget.frontPage
              : Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.0002)
                    ..rotateX((verticalDrag) / 180 * pi),
                  alignment: Alignment.center,
                  child: widget.backPage),
        ),
      );

  void setPageSide() {
    if (verticalDrag <= 90 || verticalDrag >= 270) {
      isFront = true;
    } else {
      isFront = false;
    }
  }
}
