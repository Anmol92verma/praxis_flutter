import 'package:flutter/cupertino.dart';

class Nav {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> goTo(String routeName, {dynamic argument}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: argument);
  }

  Future<dynamic> goToClearStack(String routeName) {
    return navigatorKey.currentState
        .pushNamedAndRemoveUntil(routeName, (r) => false);
  }

  bool goBack() {
    if (navigatorKey.currentState.canPop()) {
      navigatorKey.currentState.pop();
      return true;
    } else {
      return false;
    }
  }
}
