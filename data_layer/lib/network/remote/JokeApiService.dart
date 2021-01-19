import 'package:data_layer/network/NetworkManager.dart';
import 'package:data_layer/network/models/jokes/jokes_response.dart';
import 'package:flutter/material.dart';

class JokeApiService {
  NetworkManager _networkManager;

  JokeApiService(this._networkManager);

  JokesResponse getFiveRandomJokes() {
    return JokesResponse(type: "ddf", value: [
      Joke(id: 1, joke: "sdfsdfdf"),
      Joke(id: 2, joke: "sdfsdfdf"),
      Joke(id: 3, joke: "sdfsdfdf"),
      Joke(id: 4, joke: "sdfsdfdf"),
      Joke(id: 5, joke: "sdfsdfdf")
    ]);
  }

  JokesResponse getRandomJokes() {
    return JokesResponse(type: "ddf", value: [
      Joke(id: 1, joke: "sdfsdfdf"),
      Joke(id: 2, joke: "sdfsdfdf"),
      Joke(id: 3, joke: "sdfsdfdf"),
      Joke(id: 4, joke: "sdfsdfdf"),
      Joke(id: 5, joke: "sdfsdfdf")
    ]);
  }
}
