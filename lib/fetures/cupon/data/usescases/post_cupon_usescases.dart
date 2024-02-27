import 'package:flycode/fetures/cupon/data/provider/cupon_post_provider.dart';
import 'package:flycode/fetures/cupon/model/cupon_body_model.dart';
import 'package:flycode/fetures/cupon/model/cupon_model.dart';

class PostCuponUseCase {
  PostCuponUseCase();

  Future<Coupon> execute(CouponBodyModel cupon) async {
    try {
      var response = await PostCuponProvider().postNewCupon(cupon);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
