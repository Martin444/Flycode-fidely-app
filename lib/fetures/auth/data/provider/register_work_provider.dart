import 'dart:convert';
import 'dart:io';

import 'package:flycode/fetures/auth/data/repository/register_work_repository.dart';
import 'package:flycode/core/config.dart';
import 'package:http/http.dart' as http;

import '../../model/commerce_model.dart';

class RegisterWorkProvider extends RegisterWorkRespository {
  Uri registerURl = Uri.parse('$URL_FIDELY/commerces');
  @override
  Future<Commerce> registerCommerce(Commerce comerce) async {
    try {
      var response = await http.post(
        registerURl,
        headers: {'Authorization': 'Bearer $ACCESS_TOKEN'},
        body: comerce.toJson(),
      );
      var respJson = jsonDecode(response.body);
      return Commerce.fromJson(respJson);
    } catch (e) {
      throw HttpException(e.toString());
    }
  }
}
