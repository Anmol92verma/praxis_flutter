import 'dart:async';

import '../entities/joke.dart';
import '../repositories/joke_repository.dart';
import '../utils/safe_result.dart';
import 'base_use_case.dart';

class GetFiveRandomJokesUseCase extends UseCase<List<Joke>, void> {
  final JokeRepository _jokeRepository;

  GetFiveRandomJokesUseCase(this._jokeRepository);

  @override
  Future<SafeResult<List<Joke>>> call(void params) async {
    try {
      final result = await _jokeRepository.getFiveRandomJokes();
      return Success(result);
    } catch (e) {
      print(e);
      return Failure(e);
    }
  }
}
