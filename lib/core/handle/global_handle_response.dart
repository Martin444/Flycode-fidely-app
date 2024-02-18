import 'package:flycode/core/config.dart';
import 'package:flycode/routes/routes.dart';
import 'package:flycode/utils/colors/fl_colors.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GlobalResponseDialogs {
  void cerrarSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('acccesstoken', '');
    ACCESS_TOKEN = '';
    Get.offNamed(FlRoutes.LOGIN);
  }

  void showSnackError(String message) {
    Get.showSnackbar(GetSnackBar(
      title: 'Error',
      message: message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: FlColors.bgError,
      duration: const Duration(seconds: 2),
    ));
  }
}
