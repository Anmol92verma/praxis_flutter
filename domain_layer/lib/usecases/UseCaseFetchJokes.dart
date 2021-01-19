import 'package:data_layer/network/models/jokes/jokes_response.dart';
import 'package:data_layer/network/repository/JokesRepository.dart';
import 'package:domain_layer/mapper/models/UiJoke.dart';
import 'package:domain_layer/usecases/BaseUseCase.dart';

class UseCaseFetchJokes implements BaseUseCase<dynamic, List<UiJoke>> {
  JokesRepository _jokesRepository;

  UseCaseFetchJokes(this._jokesRepository);

  @override
  List<UiJoke> perform(dynamic params) {
    var jokesResponse = getJokesInternal(params);
    return UiJoke.from(jokesResponse);
  }

  JokesResponse getJokesInternal(params) {
    if (params == null) {
      return _jokesRepository.getFiveJokes();
    }
    return _jokesRepository.getRandomJokes();
  }
}
