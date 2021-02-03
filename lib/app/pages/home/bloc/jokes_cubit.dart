import 'package:bloc/bloc.dart';
import 'package:domain_layer/entities/joke.dart';
import 'package:domain_layer/usecases/get_five_random_jokes_use_case.dart';
import 'package:equatable/equatable.dart';

part 'jokes_state.dart';

class JokesCubit extends Cubit<JokesState> {
  final GetFiveRandomJokesUseCase _getFiveRandomJokesUseCase;

  JokesCubit(this._getFiveRandomJokesUseCase) : super(JokesInitial());

  Future<void> getJokes() async {
    emit(JokesLoading());
    final result = await _getFiveRandomJokesUseCase(null);
    result.fold(
      (value) => emit(JokesLoaded(value)),
      (exception) => emit(JokesError(exception.toString())),
    );
  }
}
