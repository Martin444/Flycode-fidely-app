import 'package:flycode/fetures/auth/model/user_model.dart';
import 'package:flycode/fetures/user/data/usescases/user_usescases.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  User? principalUser;
  bool isLoadingUser = false;
  Future<void> getMeInfo() async {
    try {
      isLoadingUser = true;
      update();
      var infoMe = await UserUseCase().execute();
      principalUser = infoMe;
      isLoadingUser = false;
      update();
    } catch (e) {
      print('=====================USER ERROR======================');
      isLoadingUser = false;
      update();
      print(e);
    }
  }

  String getSaludo() {
    var now = DateTime.now();

    if (now.hour < 12) {
      return 'Buenos días ${principalUser!.name!.split(' ')[0]}!';
    } else if (now.hour <= 18) {
      return 'Buenos tardes ${principalUser!.name!.split(' ')[0]}!';
    } else {
      return 'Buenos noches ${principalUser!.name!.split(' ')[0]}!';
    }
  }
}
