import 'package:flutter/material.dart';
import 'package:flycode/fetures/auth/presentation/controllers/register_controller.dart';

import 'package:flycode/widgets/inputs/input_fierld_drop.dart';
import 'package:get/get.dart';

import '../../../../utils/colors/fl_colors.dart';
import '../../../../utils/styles_fonts/fonts_styles.dart';
import '../../../../widgets/background_circles.dart';
import '../../../../widgets/button_primary.dart';
import '../../../../widgets/logo_section.dart';
import '../../../../widgets/text_imput_field.dart';
import '../../../../widgets/upload_file.dart';

class RegisterWorkPage extends StatefulWidget {
  const RegisterWorkPage({super.key});

  @override
  State<RegisterWorkPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterWorkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlColors.primaryColorsBackground,
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundCircles(
              withBlur: true,
            ),
            GetBuilder<RegisterController>(builder: (_) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const LogoSection(),
                        const SizedBox(
                          height: 50,
                        ),
                        Column(
                          children: [
                            Text(
                              'Registra tu negocio',
                              style: FlTextStyle.title1,
                            ),
                            const SizedBox(
                              height: 23,
                            ),
                            const UploadFile(),
                            const SizedBox(
                              height: 20,
                            ),
                            InputDropDown(
                              items: const [
                                'Punto de venta',
                                'Distribuidor',
                              ],
                              onSelect: (value) {
                                _.setTypeCommerce(value);
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextInputField(
                              labelText: 'Nombre del negocio',
                              controller: _.nameComerceController,
                              inputType: TextInputType.emailAddress,
                              isPass: false,
                              visibleText: false,
                              functionSubmited: (value) {
                                _.validateFormWorkRegister();
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextInputField(
                              labelText: 'Email de contacto',
                              controller: _.addressController,
                              inputType: TextInputType.emailAddress,
                              isPass: false,
                              visibleText: false,
                              functionSubmited: (value) {
                                _.validateFormWorkRegister();
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextInputField(
                              labelText: 'Descripción',
                              controller: _.descriptionController,
                              inputType: TextInputType.emailAddress,
                              isPass: false,
                              visibleText: false,
                              maxLines: 3,
                              functionSubmited: (value) {
                                _.validateFormWorkRegister();
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                    ButtonPrimary(
                      title: "Registrar",
                      disabled: !_.isValidFormWork,
                      onPressed: () {
                        _.registerWorkApi();
                      },
                      load: _.isLoadingWork,
                    ),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
