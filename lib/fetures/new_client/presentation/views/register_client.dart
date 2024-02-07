import 'package:flutter/material.dart';
import 'package:flycode/fetures/new_client/presentation/controllers/new_client_controller.dart';
import 'package:flycode/utils/colors/fl_colors.dart';
import 'package:flycode/utils/styles_fonts/fonts_styles.dart';
import 'package:flycode/widgets/background_circles.dart';
import 'package:flycode/widgets/button_primary.dart';
import 'package:flycode/widgets/card_glass.dart';
import 'package:flycode/widgets/inputs/text_imput_field.dart';
import 'package:flycode/widgets/logo_section.dart';
import 'package:get/get.dart';

class RegisterClient extends StatefulWidget {
  const RegisterClient({super.key});

  @override
  State<RegisterClient> createState() => _RegisterClientState();
}

class _RegisterClientState extends State<RegisterClient> {
  var newClient = Get.find<NewClientController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlColors.primaryColorsBackground,
      body: Stack(
        children: [
          const BackgroundCircles(),
          Obx(() {
            return Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const LogoSection(),
                      const SizedBox(
                        height: 30,
                      ),
                      CardBlured(
                        child: Column(
                          children: [
                            Text(
                              'Nuevo cliente',
                              style: FlTextStyle.title4,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextInputField(
                              labelText: 'Nombre',
                              controller: newClient.nameController,
                              inputType: TextInputType.name,
                              visibleText: false,
                              isPass: false,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextInputField(
                              labelText: 'Correo electrónico',
                              controller: newClient.emailController,
                              inputType: TextInputType.emailAddress,
                              visibleText: false,
                              isPass: false,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextInputField(
                              labelText: 'Wathsapp',
                              controller: newClient.phoneController,
                              inputType: TextInputType.phone,
                              visibleText: false,
                              isPass: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ButtonPrimary(
                        title: 'Crear',
                        onPressed: () {},
                        load: false,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
