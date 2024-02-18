import 'dart:convert';
import 'dart:io';

import 'package:flycode/fetures/auth/data/repository/register_respository.dart';
import 'package:flycode/fetures/auth/model/user_model.dart';
import 'package:flycode/core/config.dart';
import 'package:http/http.dart' as http;

import '../../../../core/exceptions/api_exception.dart';
import '../../model/user_success_model.dart';

class RegisterProvider extends RegisterRespository {
  Uri registerURl = Uri.parse('$URL_FIDELY/auth/register');
  Uri registerClientURl = Uri.parse('$URL_FIDELY/auth/create/client');

  @override
  Future<UserSuccess> registerUser(User user) async {
    try {
      var response = await http.post(
        registerURl,
        body: {
          "photoURL": user.photoURL ?? '',
          "email": user.email,
          "name": user.name,
          "phone": user.phone ?? '',
          "password": user.password ?? 'password',
          "role": user.role,
          "customerId": '9',
        },
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
        needCommerce: respJson['needCommerce'] ?? false,
      );
    } catch (e) {
      throw HttpException(e.toString());
    }
  }

  @override
  Future<UserSuccess> registerClient(User user) async {
    try {
      var response = await http.post(
        headers: {'Authorization': 'Bearer $ACCESS_TOKEN'},
        registerClientURl,
        body: {
          "photoURL": user.photoURL ?? '',
          "email": user.email,
          "name": user.name,
          "phone": user.phone ?? '',
          "password": user.password ?? 'password',
          "role": user.role,
          "customerId": '9',
        },
      );
      var respJson = jsonDecode(response.body);
      if (respJson['ownerCommerce'] == null) {
        throw ApiException(
          respJson['statusCode'] ?? 300,
          respJson['message'],
        );
      }
      return UserSuccess(
        accessToken: respJson['ownerCommerce'],
        needCommerce: respJson['needCommerce'] ?? false,
      );
    } catch (e) {
      rethrow;
    }
  }
}
