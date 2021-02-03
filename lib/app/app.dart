import 'package:flutter/material.dart';
import 'package:praxis_flutter/locator.dart';
import 'package:praxis_flutter/routing/nav.dart';
import 'package:praxis_flutter/routing/route_names.dart';
import 'package:praxis_flutter/routing/router.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Praxis Flutter",
      theme: ThemeData(
        primaryColor: Color(0xff3F51B5),
        accentColor: Color(0xffFF4081),
        buttonColor: Color(0xff009688),
      ),
      onGenerateRoute: generateRoute,
      navigatorKey: locator<Nav>().navigatorKey,
      initialRoute: homeRoute,
    );
  }
}
