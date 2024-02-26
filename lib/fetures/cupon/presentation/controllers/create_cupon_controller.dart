import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateCuponController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController photoUrlController = TextEditingController();
  RxString typeController = ''.obs;
  TextEditingController amountController = TextEditingController();
  TextEditingController percentageController = TextEditingController();
  TextEditingController expireDateController = TextEditingController();
  TextEditingController minPurchaseAmountController = TextEditingController();

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
}
