import 'package:get/get.dart';
import 'package:praxis_flutter/app/pages/home/home_controller.dart';
import 'package:praxis_flutter/routing/app_pages.dart';

/// These dependencies are scoped per page.
/// See [AppPages] for how to bind dependency to page.
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(Get.find()));
  }
}
