import 'package:flutter/material.dart';
import 'package:flycode/fetures/cupon/presentation/controllers/create_cupon_controller.dart';
import 'package:flycode/widgets/background_circles.dart';
import 'package:flycode/widgets/inputs/date_input.dart';
import 'package:flycode/widgets/inputs/input_fierld_drop.dart';
import 'package:get/get.dart';

import '../../../../routes/routes.dart';
import '../../../../utils/colors/fl_colors.dart';
import '../../../../utils/funcions/validators.dart';
import '../../../../utils/styles_fonts/fonts_styles.dart';
import '../../../../widgets/button_primary.dart';
import '../../../../widgets/inputs/text_imput_field.dart';
import '../../../../widgets/logo_section.dart';

class CreateCuponPage extends StatefulWidget {
  const CreateCuponPage({super.key});

  @override
  State<CreateCuponPage> createState() => _CreateCuponPageState();
}

class _CreateCuponPageState extends State<CreateCuponPage> {
  final cuponControl = Get.find<CreateCuponController>();
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
          const BackgroundCircles(
            withBlur: true,
          ),
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
                          titleBar: 'Nuevo cupón',
                          routeBack: FlRoutes.HOME,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Text(
                                'Nuevo cupón',
                                style: FlTextStyle.title4,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextInputField(
                                labelText: 'Titulo',
                                controller: cuponControl.titleController,
                                inputType: TextInputType.text,
                                visibleText: false,
                                validator: (value) {
                                  return FlValidators.validatoObligatory(
                                    value!,
                                  );
                                },
                                isPass: false,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextInputField(
                                labelText: 'Descripción',
                                controller: cuponControl.descriptionController,
                                inputType: TextInputType.multiline,
                                visibleText: false,
                                validator: (value) {
                                  return FlValidators.validatoObligatory(
                                    value!,
                                  );
                                },
                                isPass: false,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextInputField(
                                labelText: 'Compra mínima',
                                controller:
                                    cuponControl.minPurchaseAmountController,
                                inputType: TextInputType.number,
                                visibleText: false,
                                validator: (email) {
                                  return null;
                                },
                                isPass: false,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              DateInputField(
                                labelText: 'Fecha de expiración',
                                controller: cuponControl.expireDateController,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InputDropDown(
                                label: 'Tipo de cupón',
                                hintText: 'Elige el tipo de regalo',
                                items: const [
                                  'Descuento (%)',
                                  r'Regalo ($)',
                                ],
                                onSelect: (newValue) {
                                  cuponControl.setSelectController(
                                    'type',
                                    newValue,
                                  );
                                },
                              ),
                              Visibility(
                                visible: cuponControl
                                    .typeController.value.isNotEmpty,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    TextInputField(
                                      labelText: cuponControl
                                              .typeController.value
                                              .contains('Descuento')
                                          ? 'Porcentaje de descuento'
                                          : 'Precio',
                                      controller: cuponControl
                                              .typeController.value
                                              .contains('Descuento')
                                          ? cuponControl.percentageController
                                          : cuponControl.amountController,
                                      inputType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        if (cuponControl.typeController.value
                                            .contains('Descuento')) {
                                          return FlValidators
                                              .validatePercentage(
                                            value!,
                                          );
                                        }
                                        return null;
                                      },
                                      onChange: (value) {},
                                      visibleText: false,
                                      isPass: false,
                                    ),
                                  ],
                                ),
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
                          onPressed: () {
                            isValidForm = _formKey.currentState!.validate();
                            if (isValidForm) {}
                          },
                          load: cuponControl.isValidCreate.value,
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
