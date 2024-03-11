import 'package:flutter/material.dart';
import 'package:flycode/fetures/purchase/data/usescases/create_purchase_usescase.dart';
import 'package:flycode/fetures/purchase/models/pruchase_body_model.dart';
import 'package:flycode/fetures/purchase/models/purchase_model.dart';
import 'package:get/get.dart';

class PurchaseController extends GetxController {
  TextEditingController amountControl = TextEditingController();
  TextEditingController descriptionControl = TextEditingController();

  RxBool isValidCreatePurchase = false.obs;

  Future<PurchaseModel> createPurchaseByClientID(String id) async {
    try {
      var newPurchase = PurchaseBodyModel(
        clientId: id,
        description: descriptionControl.text,
        amount: int.tryParse(amountControl.text) ?? 0,
      );
      var response = await CreatePurchaseUseCase().execute(newPurchase);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
