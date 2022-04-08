abstract class Failure {
  factory Failure([dynamic message]) = _Failure;
  // ignore: unused_element
  const Failure._([this.message]);

  final dynamic message;
}

class _Failure implements Failure {
  const _Failure([this.message]);

  @override
  final dynamic message;
}
