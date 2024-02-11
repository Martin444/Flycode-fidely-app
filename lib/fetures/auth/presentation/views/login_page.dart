import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flycode/fetures/auth/presentation/controllers/login_controller.dart';
import 'package:flycode/routes/routes.dart';
import 'package:flycode/utils/colors/fl_colors.dart';
import 'package:get/get.dart';

import '../../../../utils/styles_fonts/fonts_styles.dart';
import '../../../../widgets/background_circles.dart';
import '../../../../widgets/button_primary.dart';
import '../../../../widgets/logo_section.dart';
import '../../../../widgets/inputs/text_imput_field.dart';

class LoginUserPage extends StatefulWidget {
  const LoginUserPage({super.key});

  @override
  State<LoginUserPage> createState() => _LoginUserPageState();
}

class _LoginUserPageState extends State<LoginUserPage> {
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
            GetBuilder<LoginController>(
              builder: (_) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
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
                                    'Inicia sesión',
                                    style: FlTextStyle.titleSecundary,
                                  ),
                                  const SizedBox(
                                    height: 23,
                                  ),

                                  TextInputField(
                                    labelText: 'Email',
                                    controller: _.emailController,
                                    inputType: TextInputType.emailAddress,
                                    isPass: false,
                                    visibleText: false,
                                    errorText: _.errorTextEmail.value,
                                    functionSubmited: (va) {
                                      _.validateBtnLoginUser().value;
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
                                    errorText: _.errorTextPassword.value,
                                    textInputAction: TextInputAction.done,
                                    function: () {
                                      setState(() {
                                        firstPass = !firstPass;
                                      });
                                    },
                                    functionSubmited: (va) {
                                      _.validateBtnLoginUser();
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: '¿No tienes cuenta? ',
                                      style: FlTextStyle.description2,
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Registrate',
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Get.toNamed(
                                                FlRoutes.REGISTER_USER,
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
                          title: "Iniciar",
                          disabled: !_.isValidInit.value,
                          onPressed: () async {
                            await _.loginWithEmailandPassword();
                          },
                          load: _.isLogging.value,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
