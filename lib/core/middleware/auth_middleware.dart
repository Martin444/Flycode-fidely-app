import 'package:flutter/material.dart';
import 'package:flycode/core/config.dart';
import 'package:flycode/routes/routes.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (ACCESS_TOKEN.isEmpty) {
      return RouteSettings(name: FlRoutes.LOGIN);
    }
    return null;
  }
}
