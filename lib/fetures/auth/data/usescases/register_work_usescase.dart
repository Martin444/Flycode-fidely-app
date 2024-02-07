import 'package:flycode/fetures/auth/data/provider/register_work_provider.dart';
import 'package:flycode/fetures/auth/model/commerce_model.dart';

class RegisterWorkUseCase {
  RegisterWorkUseCase();

  Future<Commerce> execute(Commerce commerce) async {
    try {
      var response = await RegisterWorkProvider().registerCommerce(commerce);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
