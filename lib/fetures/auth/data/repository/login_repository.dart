import 'package:flycode/fetures/auth/model/user_model.dart';
import 'package:flycode/fetures/auth/model/user_success_model.dart';

abstract class LoginRepository {
  Future<UserSuccess> loginUser(User user);
}
