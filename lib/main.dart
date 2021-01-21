import 'package:flutter/material.dart';
import 'package:praxis_flutter/app/app.dart';
import 'package:praxis_flutter/locator.dart' as di;

void main() async {
  await di.init();
  runApp(MyApp());
}
