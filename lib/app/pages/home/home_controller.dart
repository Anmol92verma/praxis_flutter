import 'package:domain_layer/usecases/get_five_random_jokes_use_case.dart';
import 'package:get/get.dart';

import '../../../routing/app_pages.dart';

/// Adding '.obs' to any variable makes to observable. We can observer them in
/// widget-tree using [Obx].
///
/// Ref: https://github.com/jonataslaw/getx/blob/master/documentation/en_US/state_management.md
class HomeController extends GetxController {
  final GetFiveRandomJokesUseCase _fiveRandomJokesUseCase;

  HomeController(this._fiveRandomJokesUseCase);

  var isLoading = false.obs;

  Future<void> getJokes() async {
    isLoading.value = true;
    final result = await _fiveRandomJokesUseCase(null);
    result.fold(
      (value) {
        isLoading.value = false;
        Get.toNamed(Routes.JOKES, arguments: value);
      },
      (exception) {
        isLoading.value = false;
        Get.snackbar("Error", exception.toString());
      },
    );
  }
}
