import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:praxis_flutter/app/pages/home/bloc/jokes_cubit.dart';
import 'package:praxis_flutter/data/repositories/joke_repository_impl.dart';
import 'package:praxis_flutter/data/sources/joke_remote_source.dart';
import 'package:praxis_flutter/domain/repositories/joke_repository.dart';
import 'package:praxis_flutter/domain/usecases/get_five_random_jokes_use_case.dart';

final locator = GetIt.instance;

Future<void> init() async {
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
