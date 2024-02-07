import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flycode/fetures/auth/presentation/controllers/register_controller.dart';
import 'package:flycode/utils/colors/fl_colors.dart';
import 'package:get/get.dart';

import '../../../../routes/routes.dart';
import '../../../../utils/styles_fonts/fonts_styles.dart';
import '../../../../widgets/background_circles.dart';
import '../../../../widgets/button_primary.dart';
import '../../../../widgets/logo_section.dart';
import '../../../../widgets/text_imput_field.dart';
import '../../../../widgets/upload_file.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({super.key});

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  bool firstPass = true;
  bool secondPass = true;

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
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: GetBuilder<RegisterController>(
                builder: (_) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        flex: 7,
                        child: LayoutBuilder(builder: (context, constrain) {
                          return SizedBox(
                            height: constrain.maxHeight,
                            child: SingleChildScrollView(
                              child: Center(
                                child: Column(
                                  children: [
                                    //Logo
                                    const Row(
                                      children: [
                                        FittedBox(
                                          child: LogoSection(),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Text(
                                      'Registrate',
                                      style: FlTextStyle.titleSecundary,
                                    ),
                                    const SizedBox(
                                      height: 23,
                                    ),
                                    const UploadFile(),
                                    const SizedBox(
                                      height: 17,
                                    ),
                                    TextInputField(
                                      labelText: 'Nombre y Apellído',
                                      controller: _.nameController,
                                      inputType: TextInputType.emailAddress,
                                      isPass: false,
                                      visibleText: false,
                                      functionSubmited: (va) {
                                        _.validateFormRegisterUser();
                                      },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    TextInputField(
                                      labelText: 'Email',
                                      controller: _.emailController,
                                      inputType: TextInputType.emailAddress,
                                      isPass: false,
                                      visibleText: false,
                                      errorText: _.errorTextEmail,
                                      functionSubmited: (va) {
                                        _.validateCorrectEmail(va);
                                        _.validateFormRegisterUser();
                                      },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    TextInputField(
                                      labelText: 'Contraseña',
                                      controller: _.passwordController,
                                      inputType: TextInputType.emailAddress,
                                      isPass: true,
                                      visibleText: firstPass,
                                      function: () {
                                        setState(() {
                                          firstPass = !firstPass;
                                        });
                                      },
                                      functionSubmited: (va) {
                                        _.validateFormRegisterUser();
                                        _.samePassword();
                                      },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    TextInputField(
                                      labelText: 'Repetir Contraseña',
                                      controller: _.passwordRetryController,
                                      inputType: TextInputType.emailAddress,
                                      isPass: true,
                                      visibleText: secondPass,
                                      errorText: _.errorTextPassword,
                                      function: () {
                                        setState(() {
                                          secondPass = !secondPass;
                                        });
                                      },
                                      functionSubmited: (va) {
                                        _.validateFormRegisterUser();
                                        _.samePassword();
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: '¿Ya tienes cuenta? ',
                                        style: FlTextStyle.description2,
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Inicia sesión',
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Get.toNamed(
                                                  FlRoutes.LOGIN,
                                                );
                                              },
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: FlColors.blueAction,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      Flexible(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: ButtonPrimary(
                            title: "Siguiente",
                            disabled: !_.validateFormRegisterUser(),
                            onPressed: () {
                              _.sendDataRegister();
                            },
                            load: _.isLoadRegister,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
