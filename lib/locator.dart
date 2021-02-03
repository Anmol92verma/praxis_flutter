import 'package:data_layer/repositories/joke_repository_impl.dart';
import 'package:data_layer/sources/joke_remote_source.dart';
import 'package:domain_layer/repositories/joke_repository.dart';
import 'package:domain_layer/usecases/get_five_random_jokes_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import 'app/pages/home/bloc/jokes_cubit.dart';
import 'routing/nav.dart';

final locator = GetIt.instance;

Future<void> init() async {
  // Navigator
  locator.registerLazySingleton(() => Nav());

  // Bloc
  locator.registerFactory(() => JokesCubit(locator()));

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
