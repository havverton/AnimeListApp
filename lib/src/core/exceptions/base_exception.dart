class BaseException<T> implements Exception {
  final T? message;

  const BaseException([this.message]);
}
