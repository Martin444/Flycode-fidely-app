import 'package:flutter/material.dart';
import 'package:flycode/core/injections_bindings.dart';
import 'package:flycode/routes/pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/config.dart';

void main() async {
  getToken();
  runApp(const MyApp());
}

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

Future<String?> getToken() async {
  var prefs = await _prefs;
  var token = prefs.getString('acccesstoken');
  if (token != null) {
    ACCESS_TOKEN = token;
  }
  return token;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fidely',
      debugShowCheckedModeBanner: false,
      getPages: FlPages.pagesRoutes,
      initialBinding: MainBindings(),
    );
  }
}
