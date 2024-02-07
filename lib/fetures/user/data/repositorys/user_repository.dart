import 'package:flycode/fetures/auth/model/user_model.dart';

abstract class UserRepository {
  Future<User> getMe();
}
