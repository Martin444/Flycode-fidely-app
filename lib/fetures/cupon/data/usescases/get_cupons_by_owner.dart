import 'package:flycode/fetures/cupon/data/provider/cupon_get_byowner.dart';
import 'package:flycode/fetures/cupon/model/cupon_model.dart';

class GetCuponsByOwnerUseCase {
  GetCuponsByOwnerUseCase();

  Future<List<Coupon>> execute() async {
    try {
      var response = await GetMyCuponsProvider().getMeCupons();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
