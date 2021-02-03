import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:praxis_flutter/app/app_binding.dart';
import 'package:praxis_flutter/routing/app_pages.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Praxis Flutter",
      theme: ThemeData(
        primaryColor: Color(0xff3F51B5),
        accentColor: Color(0xffFF4081),
        buttonColor: Color(0xff009688),
      ),
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
      initialBinding: AppBinding(),
    );
  }
}
