import 'package:flycode/fetures/auth/data/provider/register_provider.dart';
import 'package:flycode/fetures/auth/model/user_model.dart';
import 'package:flycode/fetures/auth/model/user_success_model.dart';

class RegisterUserUseCase {
  RegisterUserUseCase();

  Future<UserSuccess> execute(User user) async {
    try {
      var response = await RegisterProvider().registerUser(user);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
