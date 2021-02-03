abstract class SafeResult<T> {
  const SafeResult();

  B fold<B>(onSuccess(T value), onFailure(Exception exception));
}

class Success<T> extends SafeResult<T> {
  final T _t;

  Success(this._t);

  T get value => _t;

  @override
  B fold<B>(onSuccess(T value), onFailure(Exception exception)) =>
      onSuccess(_t);
}

class Failure<T> extends SafeResult<T> {
  final Exception _e;

  Failure(this._e);

  Exception get exception => _e;

  @override
  B fold<B>(onSuccess(T value), onFailure(Exception exception)) =>
      onFailure(_e);
}
