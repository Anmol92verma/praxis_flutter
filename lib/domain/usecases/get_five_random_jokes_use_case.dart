import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:praxis_flutter/domain/entities/joke.dart';
import 'package:praxis_flutter/domain/repositories/joke_repository.dart';

class GetFiveRandomJokesUseCase extends UseCase<List<Joke>, void> {
  final JokeRepository _jokeRepository;

  GetFiveRandomJokesUseCase(this._jokeRepository);

  @override
  Future<Stream<List<Joke>>> buildUseCaseStream(void params) async {
    final StreamController controller = StreamController<List<Joke>>();
    try {
      // assuming you pass credentials here
      final result = await _jokeRepository.getFiveRandomJokes();
      controller.add(result);
      logger.finest('GetFiveRandomJokesUseCase successful.');
      // triggers onComplete
      controller.close();
    } catch (e) {
      print(e);
      logger.severe('GetFiveRandomJokesUseCase unsuccessful.');
      // Trigger .onError
      controller.addError(e);
    }
    return controller.stream;
  }
}
