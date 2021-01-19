import 'package:data_layer/network/repository/JokesRepository.dart';
import 'package:domain_layer/usecases/BaseUseCase.dart';

class UseCaseFetchJokes implements BaseUseCase {

  JokesRepository _jokesRepository;

  UseCaseFetchJokes(this._jokesRepository);

  @override
  perfom(params) {
    return _jokesRepository.getFiveJokes();
  }

  @override
  perform() {
    return _jokesRepository.getRandomJokes();
  }
}
