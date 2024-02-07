import 'package:flycode/fetures/auth/data/provider/login_provider.dart';
import 'package:flycode/fetures/auth/model/user_model.dart';
import 'package:flycode/fetures/auth/model/user_success_model.dart';

class LoginUserUseCase {
  LoginUserUseCase();

  Future<UserSuccess> execute(User user) async {
    try {
      var response = await LoginProvider().loginUser(user);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
