import 'package:data_layer/models/joke_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/fixture_reader.dart';

void main() {
  group("jokeResponse mapper test", () {
    test(
      'should return valid jokeResponse when json is valid',
      () {
        // arrange
        final joke1 = JokeResponse(jokeId: 1, jokeText: "Joke1");
        final json = jsonFixture("joke_response.json");

        // act
        final result = JokeResponse.fromJson(json);

        // assert
        expect(result.jokeId, joke1.jokeId);
        expect(result.jokeText, joke1.jokeText);
      },
    );

    test(
      'should return valid JokeListResponse when json is valid',
      () {
        // arrange
        final json = jsonFixture("joke_list_response.json");

        // act
        final result = JokeListResponse.fromJson(json);

        //asset
        expect(result.value.length, 5);
        result.value.asMap().forEach((index, value) {
          expect(index + 1, value.jokeId);
          expect("Joke${index + 1}", value.jokeText);
        });
      },
    );
  });
}
