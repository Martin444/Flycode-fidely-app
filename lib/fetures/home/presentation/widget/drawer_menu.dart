import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flycode/utils/assets/routes/assets_routes.dart';
import 'package:flycode/utils/colors/fl_colors.dart';
import 'package:flycode/utils/styles_fonts/fonts_styles.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawMenu extends StatelessWidget {
  const DrawMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: FlColors.primaryColorsBackground,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: ListView(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: SizedBox(
                    child: SvgPicture.asset(
                      FlAssetsIcons.backIconSvg,
                      colorFilter: ColorFilter.mode(
                        FlColors.withe2,
                        BlendMode.dstIn,
                      ),
                      height: 10,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
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
            const SizedBox(
              height: 40,
            ),
            MenuTile(
              title: 'HOME',
              onTaping: () {
                Get.back();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            MenuTile(
              title: 'SUSCRIPCIONES',
              onTaping: () {
                Get.back();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            MenuTile(
              title: 'METRICAS',
              onTaping: () {
                Get.back();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            MenuTile(
              title: 'CURSOS',
              onTaping: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MenuTile extends StatelessWidget {
  String? title;
  VoidCallback? onTaping;

  MenuTile({
    Key? key,
    required this.title,
    required this.onTaping,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTaping,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title!,
          style: FlTextStyle.secundaryButtonStyle,
        ),
      ),
    );
  }
}
