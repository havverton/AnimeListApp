import 'package:injectable/injectable.dart';

import '../../../core/core.dart';
import '../domain/forecast.dart';
import 'weather_data_source/dtos/weather_dto.dart';
import 'weather_data_source/weather_data_source.dart';

@injectable
abstract class WeatherRepository {
  Future<Forecast> getForecast(String city);

  @factoryMethod
  factory WeatherRepository(
    WeatherDataSource dataSource,
    Mapper<WeatherDto, Forecast> mapper,
  ) = _WeatherRepository;
}

class _WeatherRepository extends Repository<WeatherDto, Forecast>
    implements WeatherRepository {
  final WeatherDataSource _dataSource;

  const _WeatherRepository(
      this._dataSource, Mapper<WeatherDto, Forecast> mapper)
      : super(mapper);

  @override
  Future<Forecast> getForecast(String city) async {
    try {
      final result = await _dataSource.getWeather(city);

      return toDomain(result);
    } on Exception catch (err) {
      throw UndefinedException(err);
    }
  }
}
