import 'package:data_layer/network/models/jokes/jokes_response.dart';
import 'package:data_layer/network/remote/JokeApiService.dart';

import '../RemoteSource.dart';

class JokesRemoteSource extends RemoteSource<JokesResponse> {
  JokeApiService _jokeApiService;

  @override
  fetchData() {
    return _jokeApiService.getFiveRandomJokes();
  }
}
