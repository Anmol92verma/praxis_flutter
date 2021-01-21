import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:praxis_flutter/domain/entities/joke.dart';
import 'package:praxis_flutter/domain/usecases/get_five_random_jokes_use_case.dart';

class HomePresenter extends Presenter {
  Function getJokesOnNext;
  Function getJokesOnError;

  final GetFiveRandomJokesUseCase _getFiveRandomJokesUseCase;

  HomePresenter(this._getFiveRandomJokesUseCase);

  void getJokes() =>
      _getFiveRandomJokesUseCase.execute(_GetJokesObserver(this));

  @override
  void dispose() {
    _getFiveRandomJokesUseCase.dispose();
  }
}

class _GetJokesObserver implements Observer<List<Joke>> {
  final HomePresenter _presenter;

  _GetJokesObserver(this._presenter);

  @override
  void onComplete() {
    // ignore
  }

  @override
  void onError(e) {
    assert(_presenter.getJokesOnError != null);
    _presenter.getJokesOnError(e);
  }

  @override
  void onNext(List<Joke> response) {
    assert(_presenter.getJokesOnNext != null);
    _presenter.getJokesOnNext(response);
  }
}
