import 'package:data_layer/network/remote/JokeApiService.dart';

class JokesRepository{
  JokeApiService _jokeApiService;

  JokesRepository(this._jokeApiService);

  getFiveJokes(){
    return _jokeApiService.getFiveRandomJokes();
  }

  getRandomJokes() {
    return _jokeApiService.getRandomJokes();
  }
}