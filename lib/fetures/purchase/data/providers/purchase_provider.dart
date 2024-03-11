import 'dart:convert';

import 'package:flycode/fetures/purchase/data/repository/purchase_repository.dart';
import 'package:flycode/fetures/purchase/models/pruchase_body_model.dart';
import 'package:flycode/fetures/purchase/models/purchase_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/config.dart';
import '../../../../core/exceptions/api_exception.dart';

class PurchaseProvider extends PurchaseRepository {
  Uri userURl = Uri.parse('$URL_FIDELY/commerces/purchase');
  @override
  Future<PurchaseModel> postNewPurchasebyClient(
      PurchaseBodyModel pruchase) async {
    try {
      var response = await http.post(
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $ACCESS_TOKEN',
        },
        userURl,
        body: json.encode(pruchase.toMap()),
      );
      var respJson = jsonDecode(response.body);

      if (respJson['id'] == null) {
        throw ApiException(
          respJson['statusCode'],
          respJson['message'],
        );
      }
      return PurchaseModel.fromJson(respJson);
    } catch (e) {
      rethrow;
    }
  }
}
