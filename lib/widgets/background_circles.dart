import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors/fl_colors.dart';

class BackgroundCircles extends StatefulWidget {
  final bool? withBlur;

  const BackgroundCircles({super.key, this.withBlur});

  @override
  State<BackgroundCircles> createState() => _BackgroundCirclesState();
}

class _BackgroundCirclesState extends State<BackgroundCircles> {
  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned(
          top: heigth / 5,
          right: -20,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: FlColors.circle1purple,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        Positioned(
          top: heigth / 2,
          left: -40,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: FlColors.circle2blue,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        SizedBox(
          height: Get.height,
          width: Get.width,
        ),
        Visibility(
          visible: widget.withBlur ?? false,
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 60,
                sigmaY: 60,
              ),
              child: Container(
                height: Get.height,
                width: Get.width,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
