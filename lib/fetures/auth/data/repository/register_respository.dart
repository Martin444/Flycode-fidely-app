import 'package:flycode/fetures/auth/model/user_model.dart';

abstract class RegisterRespository {
  Future<String> registerUser(User user);
}
