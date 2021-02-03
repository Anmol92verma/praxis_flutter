import 'package:get/get.dart';

import '../app/pages/home/home_binding.dart';
import '../app/pages/home/home_view.dart';
import '../app/pages/jokes/jokes_view.dart';

part 'app_routes.dart';

/// Named routing is very useful in Web.
/// GetX even support Dynamic url links.
/// See: https://github.com/jonataslaw/getx/blob/master/documentation/en_US/route_management.md#dynamic-urls-links
///
/// Ref: https://github.com/jonataslaw/getx/blob/master/documentation/en_US/route_management.md
class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.JOKES,
      page: () => JokesPage(),
    ),
  ];
}
