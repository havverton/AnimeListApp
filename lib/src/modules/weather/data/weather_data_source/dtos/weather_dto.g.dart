// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDto _$WeatherDtoFromJson(Map<String, dynamic> json) => WeatherDto(
      location: LocationDto.fromJson(json['location'] as Map<String, dynamic>),
      current: CurrentDto.fromJson(json['current'] as Map<String, dynamic>),
      forecast: _forecastFromJson(json['forecast']),
    );

Map<String, dynamic> _$WeatherDtoToJson(WeatherDto instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
      'forecast': instance.forecast,
    };

ForecastItemDto _$ForecastItemDtoFromJson(Map<String, dynamic> json) =>
    ForecastItemDto(
      date: (json['date_epoch'] as num).toDouble(),
      weather: DayDto.fromJson(json['day'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastItemDtoToJson(ForecastItemDto instance) =>
    <String, dynamic>{
      'date_epoch': instance.date,
      'day': instance.weather,
    };

CurrentDto _$CurrentDtoFromJson(Map<String, dynamic> json) => CurrentDto(
      temp: (json['temp_c'] as num).toDouble(),
      windSpeed: (json['wind_kph'] as num).toDouble(),
      windDir: json['wind_dir'] as String,
      conditionCode: _conditionFromJson(json['condition']),
    );

Map<String, dynamic> _$CurrentDtoToJson(CurrentDto instance) =>
    <String, dynamic>{
      'temp_c': instance.temp,
      'wind_kph': instance.windSpeed,
      'wind_dir': instance.windDir,
      'condition': instance.conditionCode,
    };

LocationDto _$LocationDtoFromJson(Map<String, dynamic> json) => LocationDto(
      name: json['name'] as String,
      region: json['region'] as String,
      country: json['country'] as String,
      timeZoneId: json['tz_id'] as String,
    );

Map<String, dynamic> _$LocationDtoToJson(LocationDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'tz_id': instance.timeZoneId,
    };

DayDto _$DayDtoFromJson(Map<String, dynamic> json) => DayDto(
      maxTemp: (json['maxtemp_c'] as num).toDouble(),
      minTemp: (json['mintemp_c'] as num).toDouble(),
      conditionCode: _conditionFromJson(json['condition']),
    );

Map<String, dynamic> _$DayDtoToJson(DayDto instance) => <String, dynamic>{
      'maxtemp_c': instance.maxTemp,
      'mintemp_c': instance.minTemp,
      'condition': instance.conditionCode,
    };
