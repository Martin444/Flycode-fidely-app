import 'dart:convert';
import 'package:flycode/core/exceptions/api_exception.dart';
import 'package:flycode/fetures/auth/data/repository/login_repository.dart';
import 'package:flycode/fetures/auth/model/user_model.dart';
import 'package:flycode/core/config.dart';
import 'package:flycode/fetures/auth/model/user_success_model.dart';
import 'package:http/http.dart' as http;

class LoginProvider extends LoginRepository {
  Uri registerURl = Uri.parse('$URL_FIDELY/auth/login');
  @override
  Future<UserSuccess> loginUser(User user) async {
    try {
      var response = await http.post(
        registerURl,
        body: {"email": user.email, "password": user.password},
      );
      var respJson = jsonDecode(response.body);
      if (respJson['access_token'] == null) {
        throw ApiException(
          respJson['statusCode'],
          respJson['message'],
        );
      }
      return UserSuccess(
          accessToken: respJson['access_token'],
          needCommerce: respJson['needCommerce']);
    } catch (e) {
      rethrow;
    }
  }
}
