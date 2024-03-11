import 'package:flycode/fetures/auth/model/user_model.dart';
import 'package:flycode/fetures/cupon/data/usescases/get_cupons_by_owner.dart';
import 'package:flycode/fetures/cupon/model/cupon_model.dart';
import 'package:flycode/fetures/home/data/usescases/get_clients_usescases.dart';
import 'package:flycode/fetures/home/presentation/handle/handle_client_dart.dart';
import 'package:flycode/widgets/disscount.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt indexHomePage = 0.obs;

  RxList<User> listUserResponse = <User>[].obs;
  RxString messageClient = ''.obs;

  void getClientsByUser() async {
    try {
      final listUsers = await GetClientsUseCase().execute();
      listUserResponse.value = listUsers.reversed.toList();
      messageClient.value = '';
      listUserResponse.refresh();
    } catch (e) {
      var isEmpti = HandleClientData(e).isEmptyList();
      if (isEmpti) {
        messageClient.value = 'No tienes clientes';
      }
    }
  }

  RxList<Coupon> listCuponsHome = <Coupon>[].obs;
  RxList<DiscountCard> listCuponsWisgetsHome = <DiscountCard>[].obs;

  void getCuponsByOwner() async {
    try {
      final listUsers = await GetCuponsByOwnerUseCase().execute();
      listCuponsHome.value = listUsers.reversed.toList();
      listCuponsHome.refresh();
      listCuponsWisgetsHome.clear();
      for (var element in listCuponsHome) {
        listCuponsWisgetsHome.add(DiscountCard(
          cupon: element,
        ));
        listCuponsWisgetsHome.refresh();
      }
    } catch (e) {
      HandleClientData(e).isEmptyList();
      // if (isEmpti) {
      //   messageClient.value = 'No tienes clientes';
      // }
    }
  }
}
