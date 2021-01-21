import 'package:praxis_flutter/app/pages/home/home_controller.dart';
import 'package:praxis_flutter/app/pages/home/home_presenter.dart';
import 'package:praxis_flutter/app/pages/jokes/jokes_controller.dart';
import 'package:praxis_flutter/data/repositories/joke_repository_impl.dart';
import 'package:praxis_flutter/data/sources/joke_remote_source.dart';
import 'package:praxis_flutter/domain/repositories/joke_repository.dart';
import 'package:praxis_flutter/domain/usecases/get_five_random_jokes_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final locator = GetIt.instance;

Future<void> init() async {
  // Controllers
  locator.registerFactory(() => HomeController(locator()));
  locator.registerFactory(() => JokesController());

  // Presenters
  locator.registerFactory(() => HomePresenter(locator()));

  // UseCases
  locator.registerLazySingleton(() => GetFiveRandomJokesUseCase(locator()));

  // Repository
  locator.registerLazySingleton<JokeRepository>(
    () => JokeRepositoryImpl(locator()),
  );

  // Data Source
  locator.registerLazySingleton<JokeRemoteSource>(
    () => JokeRemoteSourceImpl(locator()),
  );

  // External
  locator.registerLazySingleton(() => Client());
}
