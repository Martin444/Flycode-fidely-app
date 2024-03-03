import 'package:flycode/fetures/auth/model/user_model.dart';
import 'package:flycode/fetures/user/data/providers/user_provider.dart';

class GetUserUseCase {
  GetUserUseCase();

  Future<User> execute(String id) async {
    try {
      var response = await UserProvider().getUser(id);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
