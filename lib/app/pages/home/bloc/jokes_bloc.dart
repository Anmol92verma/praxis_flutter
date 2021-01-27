import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:praxis_flutter/domain/entities/joke.dart';
import 'package:praxis_flutter/domain/usecases/get_five_random_jokes_use_case.dart';

part 'jokes_event.dart';
part 'jokes_state.dart';

class JokesBloc extends Bloc<JokesEvent, JokesState> {
  final GetFiveRandomJokesUseCase _useCase;

  JokesBloc(this._useCase) : super(JokesInitial());

  @override
  Stream<JokesState> mapEventToState(
    JokesEvent event,
  ) async* {
    if (event is GetJokes) {
      yield JokesLoading();
      final result = await _useCase({});
      yield* result.fold(
        (value) async* {
          yield JokesLoaded(value);
        },
        (exception) async* {
          yield JokesError(exception.toString());
        },
      );
    }
  }
}
