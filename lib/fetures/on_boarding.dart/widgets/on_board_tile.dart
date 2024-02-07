import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/styles_fonts/fonts_styles.dart';

class OnBoardCard extends StatelessWidget {
  final String? title;
  final String? descrption;
  final String? pathIcon;
  const OnBoardCard({
    super.key,
    @required this.title,
    @required this.pathIcon,
    this.descrption,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(child: SvgPicture.asset(pathIcon!)),
        const SizedBox(
          height: 60,
        ),
        Padding(
          padding: EdgeInsets.only(right: Get.width / 9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: FlTextStyle.titleSecundary,
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  descrption!,
                  style: FlTextStyle.description1,
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
