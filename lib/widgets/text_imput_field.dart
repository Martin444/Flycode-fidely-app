import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flycode/utils/assets/routes/assets_routes.dart';
import 'package:flycode/utils/colors/fl_colors.dart';

import '../utils/styles_fonts/fonts_styles.dart';

// ignore: must_be_immutable
class TextInputField extends StatelessWidget {
  String labelText;
  TextEditingController controller;
  TextInputType inputType;
  TextInputAction? textInputAction;
  bool visibleText;
  bool isPass;
  int? maxLines;
  String? errorText;
  Function? function;
  Function(String)? functionSubmited;

  TextInputField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.inputType,
    required this.visibleText,
    required this.isPass,
    this.errorText,
    this.maxLines = 1,
    this.function,
    this.functionSubmited,
    this.textInputAction,
  }) : super(key: key);

  Widget getIcon() {
    if (isPass) {
      return visibleText
          ? Container(
              margin: EdgeInsets.only(
                right: 10,
                top: errorText != null ? 0 : 25,
              ),
              child: GestureDetector(
                child: SvgPicture.asset(
                  FlAssetsIcons.eyeCloseSvg,
                  height: 20,
                  color: FlColors.withe2,
                ),
                onTap: () {
                  function!();
                },
              ),
            )
          : Container(
              margin: EdgeInsets.only(
                right: 10,
                top: errorText != null ? 0 : 25,
              ),
              child: GestureDetector(
                child: SvgPicture.asset(
                  FlAssetsIcons.eyeCloseSvg,
                  height: 22,
                  fit: BoxFit.fitHeight,
                  color: FlColors.withe2,
                ),
                onTap: () {
                  function!();
                },
              ),
            );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              labelText,
              style: FlTextStyle.description2,
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: controller,
              keyboardType: inputType,
              obscureText: visibleText,
              textInputAction: textInputAction,
              maxLines: maxLines,
              cursorColor: FlColors.withe2,
              inputFormatters: inputType == TextInputType.number
                  ? <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                    ]
                  : [],
              textCapitalization: TextCapitalization.sentences,
              onChanged: functionSubmited,
              style: FlTextStyle.description1,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: FlColors.withe2,
                  ),
                ), 
                filled: true,
                focusColor: Colors.white,
                fillColor: Colors.white.withOpacity(0.3),
                errorText: errorText == '' ? null : errorText,
                errorStyle: TextStyle(
                  color: FlColors.withe2,
                  decoration: TextDecoration.lineThrough,
                ),
                alignLabelWithHint: true,
                //labelText: labelText,
                floatingLabelStyle: FlTextStyle.textInput1,
              ),
            ),
          ],
        ),
        getIcon()
      ],
    );
  }
}
