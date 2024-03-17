import 'package:flutter/material.dart';
import 'package:flycode/fetures/purchase/data/usescases/create_purchase_usescase.dart';
import 'package:flycode/fetures/purchase/data/usescases/get_purchases_by_client.dart';
import 'package:flycode/fetures/purchase/models/pruchase_body_model.dart';
import 'package:flycode/fetures/purchase/models/purchase_model.dart';
import 'package:get/get.dart';

class PurchaseController extends GetxController {
  TextEditingController amountControl = TextEditingController();
  TextEditingController descriptionControl = TextEditingController();

  RxBool isValidCreatePurchase = false.obs;
  List<PurchaseModel> purchaseByClienTSelected = [];

  Future<List<PurchaseModel>> getPurchasesByClientID(String id) async {
    try {
      purchaseByClienTSelected.clear();
      var responsePurchases = await GetPurchasesClientUsecase().execute(id);
      purchaseByClienTSelected = responsePurchases;
      update();
      return responsePurchases;
    } catch (e) {
      rethrow;
    }
  }

  Future<PurchaseModel> createPurchaseByClientID(String id) async {
    try {
      var newPurchase = PurchaseBodyModel(
        clientId: id,
        description: descriptionControl.text,
        amount: int.tryParse(amountControl.text) ?? 0,
      );
      var response = await CreatePurchaseUseCase().execute(newPurchase);
      await getPurchasesByClientID(id);
      Get.back();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
