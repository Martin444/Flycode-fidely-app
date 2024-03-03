import 'package:flutter/material.dart';
import 'package:flycode/utils/assets/routes/assets_routes.dart';
import 'package:flycode/utils/colors/fl_colors.dart';
import 'package:flycode/widgets/background_image_blur.dart';
import 'package:flycode/widgets/button_primary.dart';
import 'package:flycode/widgets/logo_section.dart';
import 'package:get/get.dart';

import '../../../on_boarding.dart/widgets/on_board_tile.dart';

class CreateCuponSuccess extends StatefulWidget {
  const CreateCuponSuccess({super.key});

  @override
  State<CreateCuponSuccess> createState() => _CreateCuponSuccessState();
}

class _CreateCuponSuccessState extends State<CreateCuponSuccess> {
  @override
  Widget build(BuildContext context) {
    return SuccesPage(
      title: 'Cupon registrado con éxito!',
      pathIcon: FlAssetsIcons.newClientSvg,
      desciprtion:
          'Mide el incremento de tus clientes y luego vemos su eficacia',
    );
  }
}

class SuccesPage extends StatelessWidget {
  final String title;
  final String? desciprtion;
  final String pathIcon;

  const SuccesPage({
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
                  const LogoSection(),
                  Expanded(
                    child: OnBoardCard(
                      title: title,
                      descrption: desciprtion,
                      pathIcon: FlAssetsIcons.newClientSvg,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonPrimary(
                    title: 'Continuar',
                    onPressed: () {
                      Get.toNamed(pathIcon);
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
