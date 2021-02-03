import 'package:domain_layer/entities/joke.dart';
import 'package:domain_layer/repositories/joke_repository.dart';

import '../sources/joke_remote_source.dart';

class JokeRepositoryImpl extends JokeRepository {
  final JokeRemoteSource _jokeRemoteSource;

  JokeRepositoryImpl(this._jokeRemoteSource);

  @override
  Future<List<Joke>> getFiveRandomJokes() {
    return _jokeRemoteSource.getFiveRandomJokes();
  }
}
