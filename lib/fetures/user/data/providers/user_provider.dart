import 'dart:convert';

import 'package:flycode/core/config.dart';
import 'package:flycode/fetures/auth/model/user_model.dart';
import 'package:flycode/fetures/user/data/repositorys/user_repository.dart';
import 'package:http/http.dart' as http;

import '../../../../core/exceptions/api_exception.dart';

class UserProvider extends UserRepository {
  Uri userURl = Uri.parse('$URL_FIDELY/user/me');
  @override
  Future<User> getMe() async {
    try {
      var response = await http.get(
        headers: {'Authorization': 'Bearer $ACCESS_TOKEN'},
        userURl,
      );
      var respJson = jsonDecode(response.body);

      if (respJson['id'] == null) {
        throw ApiException(
          respJson['statusCode'],
          respJson['message'],
        );
      }
      return User.fromJson(respJson);
    } catch (e) {
      rethrow;
    }
  }
}
