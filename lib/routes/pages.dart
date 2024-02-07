import 'package:flycode/core/middleware/auth_middleware.dart';
import 'package:flycode/fetures/auth/presentation/controllers/login_binding.dart';
import 'package:flycode/fetures/auth/presentation/views/login_page.dart';
import 'package:flycode/fetures/auth/presentation/views/register_user.dart';
import 'package:flycode/fetures/auth/presentation/views/register_work_page.dart';
import 'package:flycode/fetures/home/presentation/controllers/home_binding.dart';
import 'package:flycode/fetures/home/presentation/page/home_page.dart';
import 'package:flycode/fetures/user/presentation/controllers/user_binding.dart';
import 'package:flycode/routes/routes.dart';
import 'package:get/get.dart';

class FlPages {
  static final List<GetPage> pagesRoutes = [
    GetPage(
      name: FlRoutes.HOME,
      middlewares: [AuthMiddleware()],
      page: () => const HomePage(),
      bindings: [
        UserBinding(),
        HomeBinding(),
      ],
    ),
    GetPage(
      name: FlRoutes.LOGIN,
      page: () => const LoginUserPage(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: FlRoutes.REGISTER_USER,
      page: () => const RegisterUserPage(),
    ),
    GetPage(
      name: FlRoutes.REGISTER_WORK,
      middlewares: [AuthMiddleware()],
      page: () => const RegisterWorkPage(),
    ),
  ];
}
