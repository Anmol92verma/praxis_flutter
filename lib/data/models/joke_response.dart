import 'package:flutter/cupertino.dart';
import 'package:praxis_flutter/domain/entities/joke.dart';

class JokeListResponse {
  final String type;
  final List<JokeResponse> value;

  JokeListResponse({this.type, this.value});

  factory JokeListResponse.fromJson(Map<String, dynamic> json) {
    return JokeListResponse(
      type: json['type'],
      value: (json['value'] as List<dynamic>)
          .map((e) => JokeResponse.fromJson(e))
          .toList(),
    );
  }
}

class JokeResponse extends Joke {
  JokeResponse({@required int jokeId, @required String jokeText})
      : super(jokeId, jokeText);

  factory JokeResponse.fromJson(Map<String, dynamic> json) {
    return JokeResponse(
      jokeId: json['id'].toInt(),
      jokeText: json['joke'],
    );
  }
}
