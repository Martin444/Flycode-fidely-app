import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BackgroundImageBlur extends StatefulWidget {
  final String? pathIcon;

  const BackgroundImageBlur({
    super.key,
    required this.pathIcon,
  });

  @override
  State<BackgroundImageBlur> createState() => _BackgroundCirclesState();
}

class _BackgroundCirclesState extends State<BackgroundImageBlur> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: Get.height / 2.5),
          child: SizedBox(
            height: Get.height / 1.6,
            width: Get.width / 1.6,
            child: SvgPicture.asset(widget.pathIcon!),
          ),
        ),
        ClipRRect(
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
      ],
    );
  }
}
