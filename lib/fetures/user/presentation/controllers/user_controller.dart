import 'package:flycode/fetures/auth/model/user_model.dart';
import 'package:flycode/fetures/user/data/usescases/get_user_usescase.dart';
import 'package:flycode/fetures/user/data/usescases/user_usescases.dart';
import 'package:flycode/fetures/user/presentation/handles/user_error_handle.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  User? principalUser;
  User? selectedUser;
  bool isLoadingUser = true;
  Future<void> getMeInfo() async {
    try {
      User infoMe = await UserUseCase().execute();
      principalUser = infoMe;
      isLoadingUser = false;
      update();
    } catch (e) {
      isLoadingUser = false;
      update();
      HandleUserError(e);
    }
  }

  Future<User?> getUserInfo(String id) async {
    try {
      User infoUser = await GetUserUseCase().execute(id);
      selectedUser = infoUser;
      update();
      isLoadingUser = false;
      return selectedUser!;
    } catch (e) {
      isLoadingUser = false;
      update();
      HandleUserError(e);
    }
  }

  String getSaludo() {
    var now = DateTime.now();
    if (principalUser != null) {
      if (now.hour < 12) {
        return 'Buenos días ${principalUser!.name!.split(' ')[0]}!';
      } else if (now.hour <= 18) {
        return 'Buenos tardes ${principalUser!.name!.split(' ')[0]}!';
      } else {
        return 'Buenos noches ${principalUser!.name!.split(' ')[0]}!';
      }
    } else {
      return '';
    }
  }
}
