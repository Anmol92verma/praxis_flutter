import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:praxis_flutter/app/pages/home/home_presenter.dart';
import 'package:praxis_flutter/app/pages/jokes/jokes_view.dart';

class HomeController extends Controller {
  bool isLoading = false;

  final HomePresenter _presenter;

  HomeController(this._presenter);

  @override
  void initListeners() {
    _presenter.getJokesOnNext = (jokes) {
      isLoading = false;
      refreshUI();
      Navigator.push(
        getContext(),
        MaterialPageRoute(
          builder: (context) => JokesPage(jokes),
        ),
      );
    };

    _presenter.getJokesOnError = _onError;
  }

  void getJokes() async {
    isLoading = true;
    refreshUI();
    _presenter.getJokes();
  }

  _onError(err) {
    isLoading = true;
    refreshUI();
    ScaffoldMessenger.of(getContext()).showSnackBar(
      SnackBar(
        content: Text(err.toString()),
      ),
    );
  }
}
