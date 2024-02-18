import 'dart:convert';

import 'package:flycode/core/config.dart';
import 'package:flycode/fetures/auth/model/user_model.dart';
import 'package:flycode/fetures/home/data/repositoys/get_clients_repository.dart';
import 'package:http/http.dart' as http;

import '../../../../core/exceptions/api_exception.dart';

class GetClientsProvider extends GetClientRepository {
  Uri clientURl = Uri.parse('$URL_FIDELY/commerces/clients/list');
  @override
  Future<List<User>> getMeClients() async {
    try {
      List<User> listUserResponse = [];
      var response = await http.get(
        headers: {'Authorization': 'Bearer $ACCESS_TOKEN'},
        clientURl,
      );
      var respJson = jsonDecode(response.body);

      if (respJson[0]['id'] == null) {
        throw ApiException(
          respJson['statusCode'],
          respJson['message'],
        );
      }

      respJson.forEach((e) {
        listUserResponse.add(User.fromJson(e));
      });

      return listUserResponse;
    } catch (e) {
      rethrow;
    }
  }
}
