import 'package:data_layer/network/models/jokes/jokes_response.dart';

class UiJoke {
  int jokeId;
  String jokeText;
  String jokeType;

  UiJoke({this.jokeId, this.jokeText, this.jokeType});

  static List<UiJoke> from(JokesResponse jokesResponse) {
    return jokesResponse.value.map((e) =>
        UiJoke(jokeId: e.id, jokeText: e.joke, jokeType: jokesResponse.type));
  }
}
