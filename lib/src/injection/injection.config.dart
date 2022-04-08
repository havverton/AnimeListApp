// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:connectivity/connectivity.dart' as _i4;
import 'package:dio/dio.dart' as _i18;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app/app_module.dart' as _i23;
import '../app/routing/routing.dart' as _i3;
import '../app/utils/utils.dart' as _i17;
import '../core/classes/classes.dart' as _i11;
import '../core/core.dart' as _i10;
import '../core/logger/logger.dart' as _i8;
import '../modules/weather/data/mappers/weather_mapper.dart' as _i14;
import '../modules/weather/data/weather_data_source/dtos/weather_dto.dart'
    as _i12;
import '../modules/weather/data/weather_data_source/weather_data_source.dart'
    as _i19;
import '../modules/weather/data/weather_repository.dart' as _i20;
import '../modules/weather/domain/forecast.dart' as _i13;
import '../modules/weather/weather_module.dart' as _i24;
import '../networking/dio_client_creator.dart' as _i16;
import '../networking/dio_error_handler.dart' as _i6;
import '../networking/dio_logger.dart' as _i7;
import '../networking/networking_module.dart' as _i22;
import '../utils/connectivity_service.dart' as _i5;
import '../utils/environment_service.dart' as _i9;
import '../utils/runtime_storage.dart' as _i15;
import 'register_module.dart' as _i21; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  final networkingModule = _$NetworkingModule();
  final appModule = _$AppModule();
  final weatherModule = _$WeatherModule();
  gh.lazySingleton<_i3.AppRouter>(() => registerModule.appRouter());
  gh.factory<_i4.Connectivity>(() => networkingModule.getConnectivity());
  gh.factory<_i5.ConnectivityService>(
      () => _i5.ConnectivityService.fromConnectivity(get<_i4.Connectivity>()));
  gh.factory<_i6.DioErrorHandler>(
      () => networkingModule.getHandler(get<_i5.ConnectivityService>()));
  gh.factory<_i7.DioLogger>(
      () => networkingModule.getDioLogger(get<_i8.Logger>()));
  await gh.lazySingletonAsync<_i9.EnvironmentService>(
      () => registerModule.getEnvironmentService(),
      preResolve: true);
  gh.factory<_i10.LoggerConfiguration>(
      () => appModule.loggerConfigurationDev());
  gh.factory<_i11.Mapper<_i12.WeatherDto, _i13.Forecast>>(
      () => _i14.WeatherMapper());
  gh.lazySingleton<_i15.RuntimeStorage>(() => _i15.RuntimeStorage());
  gh.factory<String>(
      () => weatherModule.getWeatherApiKey(get<_i9.EnvironmentService>()),
      instanceName: 'weather_api_key');
  gh.factory<String>(() => weatherModule.getWeatherDomain(),
      instanceName: 'weather_domain');
  gh.factory<_i16.DioClientCreator>(() => networkingModule.getClientCreator(
      get<_i7.DioLogger>(), get<_i8.LoggerConfiguration>()));
  gh.lazySingleton<_i10.Logger>(
      () => registerModule.logger(get<_i10.LoggerConfiguration>()));
  gh.factory<_i17.LoggerBlocObserver>(
      () => appModule.createBlocLoggerObserver(get<_i10.Logger>()));
  gh.factory<_i3.RouterLoggingObserver>(() => appModule
      .createRouterLoggingObserver(get<_i10.Logger>(), get<_i3.AppRouter>()));
  await gh.singletonAsync<_i18.Dio>(
      () => networkingModule.getClient(get<_i16.DioClientCreator>()),
      preResolve: true);
  gh.factory<_i18.Dio>(
      () => weatherModule.getWeatherClinet(
          get<String>(instanceName: 'weather_domain'),
          get<_i16.DioClientCreator>()),
      instanceName: 'weahter_api_client');
  gh.factory<_i19.WeatherDataSource>(() => _i19.WeatherDataSource(
      get<_i18.Dio>(instanceName: 'weahter_api_client'),
      get<_i6.DioErrorHandler>(),
      apiKey: get<String>(instanceName: 'weather_api_key')));
  gh.factory<_i20.WeatherRepository>(() => _i20.WeatherRepository(
      get<_i19.WeatherDataSource>(),
      get<_i10.Mapper<_i12.WeatherDto, _i13.Forecast>>()));
  return get;
}

class _$RegisterModule extends _i21.RegisterModule {}

class _$NetworkingModule extends _i22.NetworkingModule {}

class _$AppModule extends _i23.AppModule {}

class _$WeatherModule extends _i24.WeatherModule {}
