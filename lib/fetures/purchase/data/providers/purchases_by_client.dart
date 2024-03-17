import 'dart:convert';

import 'package:flycode/fetures/purchase/models/purchase_model.dart';

import '../../../../core/config.dart';
import '../../../../core/exceptions/api_exception.dart';
import 'package:http/http.dart' as http;

import '../repository/get_purchase_repository.dart';

class GetPurchasesByClientsProvider extends GetPurchasesRepository {
  @override
  Future<List<PurchaseModel>> getPurchasesByClientID(String clientId) async {
    try {
      Uri userURl = Uri.parse('$URL_FIDELY/commerces/findpurchases/$clientId');
      List<PurchaseModel> listPurchases = [];
      var response = await http.get(
        headers: {'Authorization': 'Bearer $ACCESS_TOKEN'},
        userURl,
      );
      var respJson = jsonDecode(response.body);

      if (respJson[0]['id'] == null) {
        throw ApiException(
          respJson['statusCode'],
          respJson['message'],
        );
      }
      for (var element in respJson) {
        listPurchases.add(PurchaseModel.fromJson(element));
      }

      return listPurchases;
    } catch (e) {
      rethrow;
    }
  }
}
