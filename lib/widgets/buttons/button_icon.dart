import 'package:flutter/material.dart';
import 'package:flycode/utils/colors/fl_colors.dart';

import '../../utils/styles_fonts/fonts_styles.dart';

class ButtonIconText extends StatelessWidget {
  final void Function() onPressed;

  const ButtonIconText({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.playlist_add_rounded,
            color: FlColors.withe2,
            fill: 0.3,
          ),
          Text(
            'Registrar compra',
            style: FlTextStyle.secundaryButtonStyle,
          ),
        ],
      ),
    );
  }
}
