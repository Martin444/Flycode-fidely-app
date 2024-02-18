import 'package:flycode/fetures/auth/model/user_model.dart';

abstract class GetClientRepository {
  Future<List<User>> getMeClients();
}
