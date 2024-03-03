import 'dart:convert';

import 'package:flycode/core/config.dart';
import 'package:flycode/fetures/cupon/model/cupon_body_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/exceptions/api_exception.dart';
import '../../model/cupon_model.dart';
import '../respository/post_cupon_respository.dart';

class PostCuponProvider extends PostCuponRepository {
  Uri cuponURl = Uri.parse('$URL_FIDELY/coupons');
  @override
  Future<Coupon> postNewCupon(CouponBodyModel cupon) async {
    try {
      final body = json.encode(cupon.toMap());
      var response = await http.post(
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $ACCESS_TOKEN',
        },
        cuponURl,
        body: body,
      );
      var respJson = json.decode(response.body);

      if (respJson['id'] == null) {
        throw ApiException(
          respJson['statusCode'],
          respJson['message'],
        );
      }
      return Coupon.fromMap(respJson);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Coupon>> getMeCupons() {
    // TODO: implement getMeCupons
    throw UnimplementedError();
  }
}
