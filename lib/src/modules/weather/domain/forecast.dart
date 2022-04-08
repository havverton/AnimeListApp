import 'current_weather.dart';
import 'forecast_item.dart';
import 'location.dart';

abstract class Forecast {
  CurrentWeather get current;
  Location get location;
  List<ForecastItem> get forecast;

  factory Forecast({
    required CurrentWeather current,
    required Location location,
    required List<ForecastItem> forecast,
  }) = _Forecast;
}

class _Forecast implements Forecast {
  @override
  final CurrentWeather current;
  @override
  final Location location;
  @override
  final List<ForecastItem> forecast;

  _Forecast({
    required this.current,
    required this.location,
    required this.forecast,
  });
}
