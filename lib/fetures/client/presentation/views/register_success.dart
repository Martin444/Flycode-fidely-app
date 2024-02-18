import 'package:flutter/material.dart';
import 'package:flycode/utils/assets/routes/assets_routes.dart';
import 'package:flycode/utils/colors/fl_colors.dart';
import 'package:flycode/widgets/background_image_blur.dart';
import 'package:flycode/widgets/button_primary.dart';
import 'package:flycode/widgets/logo_section.dart';
import 'package:get/get.dart';

import '../../../on_boarding.dart/widgets/on_board_tile.dart';

class RegisterSuccess extends StatefulWidget {
  const RegisterSuccess({super.key});

  @override
  State<RegisterSuccess> createState() => _RegisterSuccessState();
}

class _RegisterSuccessState extends State<RegisterSuccess> {
  @override
  Widget build(BuildContext context) {
    return SuccesPage(
      title: 'Cliente registrado con éxito!',
      pathIcon: FlAssetsIcons.newClientSvg,
      desciprtion: 'Ahora crea estrategias para fidelizar y mide como avanza',
    );
  }
}

class SuccesPage extends StatelessWidget {
  String title;
  String? desciprtion;
  String pathIcon;

  SuccesPage({
    super.key,
    required this.title,
    required this.pathIcon,
    this.desciprtion,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlColors.primaryColorsBackground,
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundImageBlur(
              pathIcon: FlAssetsIcons.newClientSvg,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Column(
                children: [
                  LogoSection(),
                  Expanded(
                    child: OnBoardCard(
                      title: 'Cliente registrado con éxito!',
                      descrption:
                          'Ahora crea estrategias para fidelizar y mide el crecimiento de tu comercio',
                      pathIcon: FlAssetsIcons.newClientSvg,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonPrimary(
                    title: 'Continuar',
                    onPressed: () {
                      Get.toNamed(FlAssetsIcons.newClientSvg);
                    },
                    load: false,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
