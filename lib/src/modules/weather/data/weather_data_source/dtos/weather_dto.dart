import 'package:json_annotation/json_annotation.dart';

part 'weather_dto.g.dart';

@JsonSerializable()
class WeatherDto {
  final LocationDto location;
  final CurrentDto current;

  @JsonKey(fromJson: _forecastFromJson)
  final List<ForecastItemDto> forecast;

  WeatherDto({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherDtoFromJson(json);
}

@JsonSerializable()
class ForecastItemDto {
  @JsonKey(name: 'date_epoch')
  final double date;

  @JsonKey(name: 'day')
  final DayDto weather;

  ForecastItemDto({
    required this.date,
    required this.weather,
  });

  factory ForecastItemDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastItemDtoFromJson(json);
}

@JsonSerializable()
class CurrentDto {
  @JsonKey(name: 'temp_c')
  final double temp;

  @JsonKey(name: 'wind_kph')
  final double windSpeed;

  @JsonKey(name: 'wind_dir')
  final String windDir;

  @JsonKey(fromJson: _conditionFromJson, name: 'condition')
  final int conditionCode;

  CurrentDto({
    required this.temp,
    required this.windSpeed,
    required this.windDir,
    required this.conditionCode,
  });

  factory CurrentDto.fromJson(Map<String, dynamic> json) =>
      _$CurrentDtoFromJson(json);
}

@JsonSerializable()
class LocationDto {
  @JsonKey()
  final String name;

  @JsonKey()
  final String region;

  @JsonKey()
  final String country;

  @JsonKey(name: 'tz_id')
  final String timeZoneId;

  LocationDto({
    required this.name,
    required this.region,
    required this.country,
    required this.timeZoneId,
  });

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);
}

@JsonSerializable()
class DayDto {
  @JsonKey(name: 'maxtemp_c')
  final double maxTemp;

  @JsonKey(name: 'mintemp_c')
  final double minTemp;

  @JsonKey(fromJson: _conditionFromJson, name: 'condition')
  final int conditionCode;

  DayDto({
    required this.maxTemp,
    required this.minTemp,
    required this.conditionCode,
  });

  factory DayDto.fromJson(Map<String, dynamic> json) => _$DayDtoFromJson(json);
}

int _conditionFromJson(dynamic json) {
  if (json != null && json is Map) {
    return json['code'] as int? ?? 0;
  }

  return 0;
}

List<ForecastItemDto> _forecastFromJson(dynamic json) {
  if (json != null && json is Map) {
    return (json['forecastday'] as List<dynamic>)
        .map((dynamic json) =>
            ForecastItemDto.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  return [];
}
