import 'package:flycode/fetures/auth/model/user_model.dart';
import 'package:flycode/fetures/user/data/providers/user_provider.dart';

class UserUseCase {
  UserUseCase();

  Future<User> execute() async {
    try {
      var response = await UserProvider().getMe();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
