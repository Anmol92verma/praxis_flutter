import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:praxis_flutter/domain/entities/joke.dart';

class JokesController extends Controller {
  List<Joke> jokes;

  @override
  void initListeners() {
    // got nothing to do here :)
  }
}
