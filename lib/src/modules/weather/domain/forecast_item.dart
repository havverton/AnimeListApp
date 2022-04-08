abstract class ForecastItem {
  DateTime get date;
  double get maxTemp;
  double get minTemp;
  int get code;

  factory ForecastItem({
    required DateTime date,
    required double maxTemp,
    required double minTemp,
    required int code,
  }) = _ForecastItem;
}

class _ForecastItem implements ForecastItem {
  @override
  final DateTime date;
  @override
  final double maxTemp;
  @override
  final double minTemp;

  @override
  final int code;

  const _ForecastItem({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.code,
  });
}
