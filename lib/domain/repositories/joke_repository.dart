import 'package:praxis_flutter/domain/entities/joke.dart';

abstract class JokeRepository {
  Future<List<Joke>> getFiveRandomJokes();
}
