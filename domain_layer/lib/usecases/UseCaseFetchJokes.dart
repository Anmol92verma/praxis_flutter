import 'package:data_layer/network/models/jokes/jokes_response.dart';
import 'package:data_layer/network/repository/JokesRepository.dart';
import 'package:domain_layer/usecases/BaseUseCase.dart';

class UseCaseFetchJokes implements BaseUseCase<dynamic, JokesResponse> {
  JokesRepository _jokesRepository;

  UseCaseFetchJokes(this._jokesRepository);

  @override
  JokesResponse perform(dynamic params) {
    if (params == null) {
      return _jokesRepository.getFiveJokes();
    }
    return _jokesRepository.getRandomJokes();
  }
}
