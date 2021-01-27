import 'dart:async';

import 'package:praxis_flutter/domain/entities/joke.dart';
import 'package:praxis_flutter/domain/repositories/joke_repository.dart';
import 'package:praxis_flutter/domain/usecases/base_use_case.dart';
import 'package:praxis_flutter/domain/utils/safe_result.dart';

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
