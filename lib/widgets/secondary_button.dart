import 'package:flutter/material.dart';

import '../utils/styles_fonts/fonts_styles.dart';

class SecondaryButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;

  const SecondaryButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          title!,
          style: FlTextStyle.secundaryButtonStyle,
        ));
  }
}
