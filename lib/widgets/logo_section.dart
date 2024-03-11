// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flycode/routes/routes.dart';
import 'package:flycode/utils/assets/routes/assets_routes.dart';
import 'package:flycode/utils/colors/fl_colors.dart';
import 'package:flycode/utils/styles_fonts/fonts_styles.dart';
import 'package:flycode/widgets/secondary_button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoSection extends StatelessWidget {
  final bool? withOmit;
  final String? titleBar;
  final String? routeBack;

  const LogoSection({
    super.key,
    this.withOmit,
    this.titleBar,
    this.routeBack,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        titleBar != null
            ? Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      routeBack != null ? Get.toNamed(routeBack!) : Get.back();
                    },
                    child: SizedBox(
                      child: SvgPicture.asset(
                        FlAssetsIcons.backIconSvg,
                        color: FlColors.withe2,
                        height: 10,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    titleBar!,
                    style: FlTextStyle.title4,
                  ),
                ],
              )
            : Row(
                children: [
                  const Icon(
                    Icons.account_tree_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                  Text(
                    'Fidely',
                    style: GoogleFonts.sofia(
                      color: Colors.white,
                      fontSize: 34,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
        Visibility(
          visible: withOmit ?? false,
          child: SecondaryButton(
            title: "Omitir",
            onPressed: () {
              Get.toNamed(FlRoutes.REGISTER_USER);
            },
          ),
        )
      ],
    );
  }
}
