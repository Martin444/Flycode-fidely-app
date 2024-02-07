import 'package:flycode/fetures/auth/model/commerce_model.dart';

abstract class RegisterWorkRespository {
  Future<Commerce> registerCommerce(Commerce user);
}
