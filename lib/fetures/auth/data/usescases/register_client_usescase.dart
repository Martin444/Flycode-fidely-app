import 'package:flycode/fetures/auth/model/user_success_model.dart';

import '../../model/user_model.dart';
import '../provider/register_provider.dart';

class RegisterClientUseCase {
  RegisterClientUseCase();

  Future<UserSuccess> execute(User user) async {
    try {
      var response = await RegisterProvider().registerClient(user);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
