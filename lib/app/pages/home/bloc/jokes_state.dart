part of 'jokes_bloc.dart';

abstract class JokesState extends Equatable {
  const JokesState();

  @override
  List<Object> get props => [];
}

class JokesInitial extends JokesState {
  const JokesInitial();
}

class JokesLoading extends JokesState {
  const JokesLoading();
}

class JokesLoaded extends JokesState {
  final List<Joke> jokes;

  const JokesLoaded(this.jokes);
}

class JokesError extends JokesState {
  final String message;

  const JokesError(this.message);
}
