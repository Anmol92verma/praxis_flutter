part of 'jokes_cubit.dart';

abstract class JokesState extends Equatable {
  const JokesState();

  @override
  List<Object> get props => [];
}

class JokesInitial extends JokesState {}

class JokesLoading extends JokesState {
  const JokesLoading();
}

class JokesLoaded extends JokesState {
  final List<Joke> jokes;

  const JokesLoaded(this.jokes);

  @override
  List<Object> get props => [jokes];
}

class JokesError extends JokesState {
  final String message;

  const JokesError(this.message);

  @override
  List<Object> get props => [message];
}
