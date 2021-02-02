import 'dart:convert';

import 'package:praxis_flutter/data/constants.dart';
import 'package:praxis_flutter/data/exceptions/api_exception.dart';
import 'package:praxis_flutter/data/models/joke_response.dart';
import 'package:http/http.dart';

abstract class JokeRemoteSource {
  Future<List<JokeResponse>> getFiveRandomJokes();
}

class JokeRemoteSourceImpl extends JokeRemoteSource {
  final Client _client;

  JokeRemoteSourceImpl(this._client);

  @override
  Future<List<JokeResponse>> getFiveRandomJokes() async {
    final response = await _client.get("$BASE_URL/jokes/random/5");
    if (response.statusCode == 200) {
      return JokeListResponse.fromJson(json.decode(response.body)).value;
    } else {
      throw ApiException();
    }
  }
}
