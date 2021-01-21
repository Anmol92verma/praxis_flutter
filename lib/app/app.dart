import 'package:flutter/material.dart';

import 'pages/home/home_view.dart';

class MyApp extends StatelessWidget {
  // final Router _router;

  // MyApp() : _router = Router() {
  //   initLogger();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Praxis Flutter",
      theme: ThemeData(
        primaryColor: Color(0xff3F51B5),
        accentColor: Color(0xffFF4081),
        buttonColor: Color(0xff009688),
      ),
      home: HomePage(),
    );
  }
}
