import 'package:data_layer/repositories/joke_repository_impl.dart';
import 'package:data_layer/sources/joke_remote_source.dart';
import 'package:domain_layer/repositories/joke_repository.dart';
import 'package:domain_layer/usecases/get_five_random_jokes_use_case.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:praxis_flutter/app/pages/home/home_binding.dart';

/// Define app level dependencies here.
/// Don't put controllers here. They can go into respective bindings for
/// each page, like [HomeBinding].
///
/// Ref: https://github.com/jonataslaw/getx/blob/master/documentation/en_US/dependency_management.md
class AppBinding extends Bindings {
  @override
  void dependencies() {
    // UseCases
    Get.lazyPut(() => GetFiveRandomJokesUseCase(Get.find()));

    // Repository
    Get.lazyPut<JokeRepository>(
      () => JokeRepositoryImpl(Get.find()),
    );

    // Data Source
    Get.lazyPut<JokeRemoteSource>(
      () => JokeRemoteSourceImpl(Get.find()),
    );

    // External
    Get.lazyPut(() => Client());
  }
}
