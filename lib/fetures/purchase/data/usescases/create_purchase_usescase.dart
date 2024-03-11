import 'package:flycode/fetures/purchase/data/providers/purchase_provider.dart';
import 'package:flycode/fetures/purchase/models/pruchase_body_model.dart';
import 'package:flycode/fetures/purchase/models/purchase_model.dart';

class CreatePurchaseUseCase {
  CreatePurchaseUseCase();

  Future<PurchaseModel> execute(PurchaseBodyModel purchase) async {
    try {
      var response = await PurchaseProvider().postNewPurchasebyClient(purchase);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
