import 'package:flutter/material.dart';
import 'package:flycode/fetures/cupon/data/usescases/post_cupon_usescases.dart';
import 'package:flycode/fetures/cupon/model/cupon_body_model.dart';
import 'package:flycode/utils/assets/routes/assets_routes.dart';
import 'package:get/get.dart';

import '../../../../routes/routes.dart';

class CreateCuponController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController photoUrlController = TextEditingController();
  RxString typeController = ''.obs;
  TextEditingController amountController = TextEditingController();
  TextEditingController percentageController = TextEditingController();
  TextEditingController expireDateController = TextEditingController();
  TextEditingController minPurchaseAmountController = TextEditingController();
  TextEditingController maxUsageController = TextEditingController();

  RxBool isValidCreate = false.obs;

  void setSelectController(String key, String newValue) {
    switch (key) {
      case 'type':
        typeController.value = newValue;
        amountController.clear();
        percentageController.clear();
        break;
      default:
    }
  }

  RxBool isValidCreatedCupon = false.obs;
  RxBool isLoadNewCupon = false.obs;

  void validateAndSetCupon(bool isValid) {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        typeController.value.isNotEmpty &&
        (amountController.text.isNotEmpty ||
            percentageController.text.isNotEmpty) &&
        expireDateController.text.isNotEmpty &&
        minPurchaseAmountController.text.isNotEmpty) {
      isValidCreatedCupon.value = true;
    } else {
      isValidCreatedCupon.value = false;
    }
  }

  void createNewCupon() async {
    try {
      isLoadNewCupon.value = true;
      isLoadNewCupon.refresh();

      final parts = expireDateController.text
          .split('/'); // Dividimos la cadena por las barras "/"
      final day = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final year = int.parse(parts[2]);

      var newCupon = await PostCuponUseCase().execute(
        CouponBodyModel(
          photoURL: FlAssetsImages.catito,
          title: titleController.text,
          description: descriptionController.text,
          type: typeController.value,
          percentage: percentageController.text.isNotEmpty
              ? int.parse(percentageController.text)
              : 0,
          amount: amountController.text.isNotEmpty
              ? int.parse(amountController.text)
              : 0,
          expiryDate: expireDateController.text.isNotEmpty
              ? DateTime(year, month, day)
              : null,
          minPurchaseAmount: int.parse(minPurchaseAmountController.text),
          maxUsageCount: maxUsageController.text.isNotEmpty
              ? int.tryParse(maxUsageController.text)
              : 0,
          applicableProducts: [''],
          eligibleUsers: [''],
        ),
      );
      print(newCupon.toMap());
      isLoadNewCupon.value = false;
      isLoadNewCupon.refresh();
      Get.toNamed(FlRoutes.CREATE_CUPON_SUCCESS);
    } catch (e) {
      print(e);
      isLoadNewCupon.value = false;
      isLoadNewCupon.refresh();
    }
  }
}
