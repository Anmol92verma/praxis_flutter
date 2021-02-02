import 'package:praxis_flutter/data/exceptions/api_exception.dart';
import 'package:praxis_flutter/domain/entities/joke.dart';
import 'package:praxis_flutter/domain/repositories/joke_repository.dart';
import 'package:praxis_flutter/domain/usecases/get_five_random_jokes_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockJokeRepository extends Mock implements JokeRepository {}

main() {
  MockJokeRepository mockRepository;
  GetFiveRandomJokesUseCase useCase;

  final jokeList = [Joke(1, "Joke1")];

  setUp(() {
    mockRepository = MockJokeRepository();
    useCase = GetFiveRandomJokesUseCase(mockRepository);
  });

  group("GetFiveRandomJokesUseCaseTest", () {
    test("when repository return success should emit next with list of jokes",
        () async {
      // arrange
      when(mockRepository.getFiveRandomJokes())
          .thenAnswer((_) async => jokeList);

      // act
      final result = await useCase.buildUseCaseStream(null);

      // assert
      final emitOrder = [emits(jokeList), emitsDone];
      expect(result, emitsInOrder(emitOrder));
    });

    test(
        "when repository fails with exception should emit error with exception",
        () async {
      // arrange
      final exception = ApiException();
      when(mockRepository.getFiveRandomJokes())
          .thenAnswer((_) => throw exception);

      // act
      final result = await useCase.buildUseCaseStream(null);

      // assert
      expect(result, emitsError(exception));
    });
  });
}
