import 'package:flycode/fetures/auth/model/user_model.dart';
import 'package:flycode/fetures/home/data/providers/get_clients_provider.dart';

class GetClientsUseCase {
  GetClientsUseCase();

  Future<List<User>> execute() async {
    try {
      var response = await GetClientsProvider().getMeClients();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
