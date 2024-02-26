import 'package:flycode/core/middleware/auth_middleware.dart';
import 'package:flycode/fetures/auth/presentation/controllers/login_binding.dart';
import 'package:flycode/fetures/auth/presentation/views/login_page.dart';
import 'package:flycode/fetures/auth/presentation/views/register_user.dart';
import 'package:flycode/fetures/auth/presentation/views/register_work_page.dart';
import 'package:flycode/fetures/cupon/presentation/controllers/create_cupon_binding.dart';
import 'package:flycode/fetures/cupon/presentation/pages/create_cupon_page.dart';
import 'package:flycode/fetures/home/presentation/controllers/home_binding.dart';
import 'package:flycode/fetures/home/presentation/page/home_page.dart';
import 'package:flycode/fetures/client/presentation/controllers/new_client_binding.dart';
import 'package:flycode/fetures/client/presentation/views/register_client.dart';
import 'package:flycode/fetures/client/presentation/views/register_success.dart';
import 'package:flycode/fetures/user/presentation/controllers/user_binding.dart';
import 'package:flycode/fetures/user/presentation/page/user_page.dart';
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
    GetPage(
      name: FlRoutes.REGISTER_CLIENT,
      transition: Transition.fadeIn,
      middlewares: [AuthMiddleware()],
      binding: NewClientBinding(),
      page: () => const RegisterClient(),
    ),
    GetPage(
      name: FlRoutes.REGISTER_SUCCESS,
      transition: Transition.fadeIn,
      middlewares: [AuthMiddleware()],
      binding: NewClientBinding(),
      page: () => const RegisterSuccess(),
    ),
    GetPage(
      name: FlRoutes.CREATE_CUPON,
      transition: Transition.fadeIn,
      middlewares: [AuthMiddleware()],
      binding: CreateCuponBinding(),
      page: () => const CreateCuponPage(),
    ),
    GetPage(
      name: FlRoutes.USER_PROFILE,
      transition: Transition.fadeIn,
      middlewares: [AuthMiddleware()],
      binding: UserBinding(),
      page: () => const UserPage(),
    ),
  ];
}
