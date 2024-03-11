import 'package:flutter/material.dart';
import 'package:flycode/fetures/purchase/presentation/controllers/purchase_controller.dart';
import 'package:flycode/utils/formaters/Strings/currency_converter.dart';
import 'package:flycode/widgets/background_circles.dart';
import 'package:get/get.dart';

import '../../../../../utils/colors/fl_colors.dart';
import '../../../../../utils/funcions/validators.dart';
import '../../../../../utils/styles_fonts/fonts_styles.dart';
import '../../../../../widgets/button_primary.dart';
import '../../../../../widgets/inputs/text_imput_field.dart';
import '../../../../../widgets/logo_section.dart';

class CreatePurchasePage extends StatefulWidget {
  const CreatePurchasePage({super.key});

  @override
  State<CreatePurchasePage> createState() => _CreatePurchasePageState();
}

class _CreatePurchasePageState extends State<CreatePurchasePage> {
  final purchControl = Get.find<PurchaseController>();
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
                        const LogoSection(
                          titleBar: 'Nueva compra',
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Text(
                                'Detalle de compra',
                                style: FlTextStyle.title4,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextInputField(
                                labelText: 'Concepto',
                                controller: purchControl.descriptionControl,
                                inputType: TextInputType.name,
                                visibleText: false,
                                validator: (value) {
                                  return FlValidators.validatoObligatory(
                                    value!,
                                  );
                                },
                                onChange: (value) {},
                                isPass: false,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextInputField(
                                labelText: 'Monto total',
                                controller: purchControl.amountControl,
                                inputType: TextInputType.number,
                                visibleText: false,
                                validator: (value) {
                                  return FlValidators.validatoObligatory(
                                    value!,
                                  );
                                },
                                onChange: (value) {
                                  setState(() {});
                                },
                                isPass: false,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total a pagar: ${purchControl.amountControl.value.text.convertToCorrency()}',
                          style: FlTextStyle.title3,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ButtonPrimary(
                          title: 'Crear',
                          onPressed: () {
                            purchControl
                                .createPurchaseByClientID(Get.arguments);
                          },
                          disabled: purchControl.isValidCreatePurchase.value,
                          load: false,
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
