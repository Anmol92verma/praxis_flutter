abstract class BaseUseCase<IN, OUT> {
  OUT perform(IN params);
}
