abstract class BaseUseCase<IN, OUT> {
  OUT perfom(IN params);
  OUT perform();
}
