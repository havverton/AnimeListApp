import 'package:injectable/injectable.dart';

import '../../../../core/classes/classes.dart';
import '../../domain/current_weather.dart';
import '../../domain/forecast.dart';
import '../../domain/forecast_item.dart';
import '../../domain/location.dart';
import '../weather_data_source/dtos/weather_dto.dart';

@Injectable(as: Mapper<WeatherDto, Forecast>)
class WeatherMapper extends Mapper<WeatherDto, Forecast> {
  Location _mapLocation(LocationDto dto) {
    return Location(
      name: dto.name,
      region: dto.region,
      country: dto.country,
    );
  }

  CurrentWeather _mapCurrent(CurrentDto dto) {
    return CurrentWeather(
      code: dto.conditionCode,
      temp: dto.temp,
      windSpeed: dto.windSpeed,
    );
  }

  List<ForecastItem> _mapForecast(List<ForecastItemDto> list) {
    return list.map((e) {
      return ForecastItem(
        code: e.weather.conditionCode,
        date: DateTime.fromMillisecondsSinceEpoch(e.date.toInt() * 1000),
        maxTemp: e.weather.maxTemp,
        minTemp: e.weather.minTemp,
      );
    }).toList();
  }

  @override
  Forecast toDomain(WeatherDto model) {
    return Forecast(
      current: _mapCurrent(model.current),
      location: _mapLocation(model.location),
      forecast: _mapForecast(model.forecast),
    );
  }

  @override
  WeatherDto toModel(Forecast domain) {
    throw UnimplementedError();
  }
}
