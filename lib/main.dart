import 'package:flutter/material.dart';
import 'package:flycode/core/injections_bindings.dart';
import 'package:flycode/routes/pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
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
