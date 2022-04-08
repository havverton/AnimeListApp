typedef BreakPointPredicate = bool Function(double);

abstract class BreakPoint {
  bool active(double width);

  factory BreakPoint.custom(BreakPointPredicate predicate) = _BreakPoint;

  factory BreakPoint.lessThen(double value) =>
      _BreakPoint((width) => width <= value);

  factory BreakPoint.moreThen(double value) =>
      _BreakPoint((width) => width >= value);
}

class _BreakPoint implements BreakPoint {
  final BreakPointPredicate predicate;

  const _BreakPoint(this.predicate);

  @override
  bool active(double width) => predicate(width);
}
