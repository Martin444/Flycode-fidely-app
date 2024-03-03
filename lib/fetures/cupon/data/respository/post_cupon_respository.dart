import 'package:flycode/fetures/cupon/model/cupon_body_model.dart';
import 'package:flycode/fetures/cupon/model/cupon_model.dart';

abstract class PostCuponRepository {
  Future<Coupon> postNewCupon(CouponBodyModel cupon);

  Future<List<Coupon>> getMeCupons();
}
