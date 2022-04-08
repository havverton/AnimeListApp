import 'package:freezed_annotation/freezed_annotation.dart';

part 'either.freezed.dart';

/// Entity to describe calculations that can go two ways [L] or [R]
/// Classically used for error handling, the usual left-hand side acts as the error and the right-hand side as the result
@freezed
class Either<L, R> with _$Either<L, R> {
  const Either._();

  const factory Either.left(L left) = _EitherLeft;

  const factory Either.right(R right) = _EitherRight;

  B fold<B>(B Function(L) ifLeft, B Function(R) ifRight) {
    if (isLeft) {
      return ifLeft(left);
    }

    return ifRight(right);
  }

  bool get isLeft => this is _EitherLeft<L, R>;

  bool get isRight => this is _EitherRight<L, R>;

  /// Represents the left part of the [Either] class, which by convention is "Error
  L get left => (this as _EitherLeft<L, R>).left;

  /// Represents the right-hand side of the [Either] class, which by convention is "Success
  R get right => (this as _EitherRight<L, R>).right;
}
