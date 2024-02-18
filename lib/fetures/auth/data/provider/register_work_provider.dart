import 'dart:convert';
import 'dart:io';

import 'package:flycode/fetures/auth/data/repository/register_work_repository.dart';
import 'package:flycode/core/config.dart';
import 'package:http/http.dart' as http;

import '../../model/commerce_model.dart';

class RegisterWorkProvider extends RegisterWorkRespository {
  Uri registerURl = Uri.parse('$URL_FIDELY/commerces');
  @override
  // ignore: avoid_renaming_method_parameters
  Future<Commerce> registerCommerce(Commerce commerce) async {
    try {
      var newCommerce = await http.post(
        registerURl,
        headers: {'Authorization': 'Bearer $ACCESS_TOKEN'},
        body: commerce.toJson(),
      );
      var respJson = jsonDecode(newCommerce.body);
      return Commerce.fromJson(respJson);
    } catch (e) {
      throw HttpException(e.toString());
    }
  }
}
