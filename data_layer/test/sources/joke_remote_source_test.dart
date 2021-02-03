import 'package:data_layer/exceptions/api_exception.dart';
import 'package:data_layer/models/joke_response.dart';
import 'package:data_layer/sources/joke_remote_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

import '../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements Client {}

class MockJokeListResponse extends Mock implements JokeListResponse {}

main() {
  MockHttpClient mockClient;
  JokeRemoteSource source;

  setUp(() {
    mockClient = MockHttpClient();
    source = JokeRemoteSourceImpl(mockClient);
  });

  test("when client return success should return jokes list", () async {
    // arrange
    when(mockClient.get(any)).thenAnswer(
        (_) async => Response(fixture("joke_list_response.json"), 200));

    // act
    final result = await source.getFiveRandomJokes();

    // assert
    expect(result.length, equals(5));
  });

  test("when client return failure should throw api exception", () async {
    // arrange
    when(mockClient.get(any)).thenAnswer((_) async => Response("{}", 400));

    // act
    final call = source.getFiveRandomJokes;

    // assert
    expect(() => call(), throwsA(isA<ApiException>()));
  });
}
