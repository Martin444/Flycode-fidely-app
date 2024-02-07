import 'package:flutter/material.dart';
import 'package:flycode/utils/colors/fl_colors.dart';

import '../utils/styles_fonts/fonts_styles.dart';

// ignore: must_be_immutable
class ButtonRounded extends StatelessWidget {
  //parametros
  String title;
  VoidCallback onPressed;
  bool load;
  bool disabled = false;

  ButtonRounded({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.load,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: disabled
              ? MaterialStateProperty.all(Colors.grey[300])
              : MaterialStateProperty.all(FlColors.blueSelector),
          overlayColor: MaterialStateProperty.all(
            Colors.white.withOpacity(0.1),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 10),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          shadowColor: MaterialStateProperty.all(FlColors.blueSelector),
        ),
        onPressed: disabled ? null : onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            !load
                ? Text(
                    title,
                    textAlign: TextAlign.center,
                    style: FlTextStyle.secundaryButtonStyle,
                  )
                : const SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black87),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
