import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../networking/dio_client_creator.dart';
import '../../utils/environment_service.dart';

abstract class WeatherInjectableNames {
  static const domain = 'weather_domain';
  static const apiKey = 'weather_api_key';
  static const api_client = 'weahter_api_client';
}

@module
abstract class WeatherModule {
  @Named(WeatherInjectableNames.apiKey)
  String getWeatherApiKey(EnvironmentService service) {
    return service.get('API_KEY');
  }

  @Named(WeatherInjectableNames.domain)
  String getWeatherDomain() {
    return 'https://api.weatherapi.com';
  }

  @Named(WeatherInjectableNames.api_client)
  Dio getWeatherClinet(
    @Named(WeatherInjectableNames.domain) String domain,
    DioClientCreator clientCreator,
  ) {
    return clientCreator.create(domain);
  }
}
