import 'dart:ui';

import 'package:flutter/material.dart';

class CardBlured extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final Widget? child;

  const CardBlured({
    Key? key,
    required this.child,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5,
          sigmaY: 5,
        ),
        child: Container(
          margin: margin ?? EdgeInsets.zero,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
          ),
          child: child,
        ),
      ),
    );
  }
}
