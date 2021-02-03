import 'package:flutter/material.dart';

import 'app/app.dart';
import 'locator.dart' as di;

void main() async {
  await di.init();
  runApp(MyApp());
}
