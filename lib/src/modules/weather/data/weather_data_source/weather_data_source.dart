import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../networking/dio_error_handler.dart';
import '../../weather_module.dart';
import 'dtos/weather_dto.dart';

@injectable
abstract class WeatherDataSource {
  Future<WeatherDto> getWeather(String region, {int days});

  @factoryMethod
  factory WeatherDataSource(
    @Named(WeatherInjectableNames.api_client) Dio client,
    DioErrorHandler handler, {
    @Named(WeatherInjectableNames.apiKey) required String apiKey,
  }) = _WeatherDataSource;
}

class _WeatherDataSource implements WeatherDataSource {
  final Dio client;
  final DioErrorHandler dioHandler;
  final String apiKey;

  const _WeatherDataSource(
    this.client,
    this.dioHandler, {
    required this.apiKey,
  });

  @override
  Future<WeatherDto> getWeather(String region, {int days = 3}) async {
    final response = await dioHandler<Map<String, dynamic>>(
      () {
        return client.get(
          '/v1/forecast.json',
          queryParameters: <String, dynamic>{
            'q': region,
            'key': apiKey,
            'days': days,
            'aqi': 'no',
            'alerts': 'no',
          },
        );
      },
    );

    if (response.data == null) {
      throw const UndefinedException('No data from Api');
    }

    return WeatherDto.fromJson(response.data!);
  }
}
