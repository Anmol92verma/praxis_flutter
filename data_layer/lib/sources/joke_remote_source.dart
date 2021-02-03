import 'dart:convert';

import 'package:data_layer/exceptions/api_exception.dart';
import 'package:http/http.dart';

import '../constants.dart';
import '../models/joke_response.dart';

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
