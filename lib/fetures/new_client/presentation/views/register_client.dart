import 'package:flutter/material.dart';
import 'package:flycode/fetures/new_client/presentation/controllers/new_client_controller.dart';
import 'package:flycode/routes/routes.dart';
import 'package:flycode/utils/colors/fl_colors.dart';
import 'package:flycode/utils/funcions/validators.dart';
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
  final _formKey = GlobalKey<FormState>();

  bool isValidForm = false;

  bool getValid() {
    if (_formKey.currentState == null) return false;

    return _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlColors.primaryColorsBackground,
      body: Stack(
        children: [
          const BackgroundCircles(),
          Obx(
            () {
              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        LogoSection(
                          titleBar: 'Nuevo cliente',
                          routeBack: FlRoutes.HOME,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CardBlured(
                          child: Form(
                            key: _formKey,
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
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Este campo es obligatorio';
                                    }
                                    // Puedes agregar más lógica de validación aquí según tus necesidades.
                                    return null;
                                  },
                                  isPass: false,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextInputField(
                                  labelText: 'Correo electrónico',
                                  controller: newClient.emailController,
                                  inputType: TextInputType.emailAddress,
                                  visibleText: false,
                                  validator: (email) {
                                    if (email != null) {
                                      var emailValid =
                                          FlValidators.validateEmail(email);

                                      if (!emailValid) {
                                        return 'Escribe un email valido';
                                      }
                                      return null;
                                    }
                                    return null;
                                  },
                                  isPass: false,
                                ),
                                const SizedBox(
                                  height: 15,
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
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ButtonPrimary(
                          title: 'Crear',
                          onPressed: () {
                            isValidForm = _formKey.currentState!.validate();
                            if (isValidForm) {
                              newClient.registerClientCommerce();
                            }
                          },
                          load: newClient.isLoading.value,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
