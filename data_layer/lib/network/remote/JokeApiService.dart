import 'package:data_layer/network/NetworkManager.dart';
import 'package:flutter/material.dart';

class JokeApiService{
  NetworkManager _networkManager;

  JokeApiService(this._networkManager);

  void getFiveRandomJokes(){
    // jokes/random/5
  }

}