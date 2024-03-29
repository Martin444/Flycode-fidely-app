import 'package:flutter/material.dart';

import '../utils/styles_fonts/fonts_styles.dart';

// ignore: must_be_immutable
class ButtonPrimary extends StatelessWidget {
  //parametros
  String title;
  VoidCallback? onPressed;
  bool load;
  bool disabled = false;

  ButtonPrimary({
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
          backgroundColor: disabled || onPressed == null
              ? MaterialStateProperty.all(Colors.grey[400])
              : MaterialStateProperty.all(Colors.white),
          overlayColor: MaterialStateProperty.all(
            Colors.black.withOpacity(0.2),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 10),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: disabled || onPressed == null ? null : onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            !load
                ? Text(
                    title,
                    textAlign: TextAlign.center,
                    style: FlTextStyle.primaryButtonStyle,
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
