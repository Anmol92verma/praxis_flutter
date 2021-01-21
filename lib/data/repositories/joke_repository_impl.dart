import 'package:praxis_flutter/data/sources/joke_remote_source.dart';
import 'package:praxis_flutter/domain/entities/joke.dart';
import 'package:praxis_flutter/domain/repositories/joke_repository.dart';

class JokeRepositoryImpl extends JokeRepository {
  final JokeRemoteSource _jokeRemoteSource;

  JokeRepositoryImpl(this._jokeRemoteSource);

  @override
  Future<List<Joke>> getFiveRandomJokes() {
    return _jokeRemoteSource.getFiveRandomJokes();
  }
}
