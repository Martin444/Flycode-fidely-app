import 'package:flycode/core/config.dart';
import 'package:flycode/routes/routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GlobalResponseDialogs {
  void cerrarSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('acccesstoken', '');
    ACCESS_TOKEN = '';
    Get.offNamed(FlRoutes.LOGIN);
  }
}
