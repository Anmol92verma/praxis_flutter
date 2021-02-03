import 'package:flutter/material.dart';

import '../app/pages/home/home_view.dart';
import '../app/pages/jokes/jokes_view.dart';
import 'route_names.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return _getPageRoute(HomePage(), settings);
    case jokesRoute:
      return _getPageRoute(JokesPage(), settings);
    default:
      return _getPageRoute(HomePage(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return (MaterialPageRoute(
    settings: settings,
    builder: (context) => child,
  ));
}
