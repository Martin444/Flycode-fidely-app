import 'package:flycode/fetures/auth/model/user_model.dart';

import '../../model/user_success_model.dart';

abstract class RegisterRespository {
  Future<UserSuccess> registerUser(User user);

  Future<UserSuccess> registerClient(User user);
}
