import 'dart:convert';

import 'package:flycode/fetures/cupon/model/cupon_body_model.dart';

import '../../../../core/config.dart';
import '../../../../core/exceptions/api_exception.dart';
import '../../model/cupon_model.dart';
import '../respository/post_cupon_respository.dart';
import 'package:http/http.dart' as http;

class GetMyCuponsProvider extends PostCuponRepository {
  Uri userURl = Uri.parse('$URL_FIDELY/coupons/mycupons/commerces');
  @override
  Future<List<Coupon>> getMeCupons() async {
    try {
      List<Coupon> listCupons = [];
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
        listCupons.add(Coupon.fromMap(element));
      }

      return listCupons;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Coupon> postNewCupon(CouponBodyModel cupon) {
    throw UnimplementedError();
  }
}
