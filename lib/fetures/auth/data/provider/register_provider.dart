import 'dart:io';

import 'package:flycode/fetures/auth/data/repository/register_respository.dart';
import 'package:flycode/fetures/auth/model/user_model.dart';
import 'package:flycode/core/config.dart';
import 'package:http/http.dart' as http;

class RegisterProvider extends RegisterRespository {
  Uri registerURl = Uri.parse('$URL_FIDELY/auth/register');
  @override
  Future<String> registerUser(User user) async {
    try {
      var response = await http.post(
        registerURl,
        body: {
          "photoURL": user.photoURL,
          "email": user.email,
          "name": user.name,
          "phone": user.phone,
          "password": user.password,
          "role": user.role,
          "customerId": '9',
        },
      );
      return response.body;
    } catch (e) {
      throw HttpException(e.toString());
    }
  }
}
