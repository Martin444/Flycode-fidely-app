import 'package:flycode/fetures/purchase/data/providers/purchases_by_client.dart';
import 'package:flycode/fetures/purchase/models/purchase_model.dart';

class GetPurchasesClientUsecase {
  GetPurchasesClientUsecase();

  Future<List<PurchaseModel>> execute(String clientId) async {
    try {
      var response =
          await GetPurchasesByClientsProvider().getPurchasesByClientID(
        clientId,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
