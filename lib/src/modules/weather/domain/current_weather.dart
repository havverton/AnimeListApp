abstract class CurrentWeather {
  double get windSpeed;
  double get temp;
  int get code;

  factory CurrentWeather({
    required double temp,
    required int code,
    double windSpeed,
  }) = _CurrentWeather;
}

class _CurrentWeather implements CurrentWeather {
  @override
  final double windSpeed;
  @override
  final double temp;

  @override
  final int code;

  _CurrentWeather({
    required this.temp,
    required this.code,
    this.windSpeed = 0,
  });
}
