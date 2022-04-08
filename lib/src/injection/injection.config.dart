// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app/pages/home/bloc/home_bloc.dart' as _i15;
import '../app/pages/home/home_service.dart' as _i13;
import '../app/routing/routing.dart' as _i3;
import '../arch/dio_error_handler/dio_error_handler.dart' as _i11;
import '../core/core.dart' as _i9;
import '../core/http/dio_client_creator.dart' as _i14;
import '../core/http/dio_logger.dart' as _i12;
import '../core/http/http_client.dart' as _i17;
import '../core/logger/logger_configuration.dart' as _i4;
import '../modules/counter/counter_repository.dart' as _i6;
import '../modules/counter/use_cases/decrement_usecase.dart' as _i7;
import '../modules/counter/use_cases/increment_usecase.dart' as _i8;
import '../modules/counter/use_cases/reset_usecase.dart' as _i10;
import '../utils/runtime_storage.dart' as _i5;
import 'register_module.dart' as _i18; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AppRouter>(() => registerModule.appRouter());
  gh.factory<_i4.LoggerConfiguration>(
      () => registerModule.loggerConfigurationDev());
  gh.lazySingleton<_i5.RuntimeStorage>(() => _i5.RuntimeStorage());
  gh.factory<String>(() => registerModule.domainUrl(), instanceName: 'domain');
  gh.factory<_i6.CounterRepository>(
      () => _i6.CounterRepository(get<_i5.RuntimeStorage>()));
  gh.factory<_i7.DecrementUsecase>(
      () => _i7.DecrementUsecase(get<_i6.CounterRepository>()));
  gh.factory<_i8.IncrementUsecase>(
      () => _i8.IncrementUsecase(get<_i6.CounterRepository>()));
  gh.lazySingleton<_i9.Logger>(
      () => registerModule.logger(get<_i4.LoggerConfiguration>()));
  gh.factory<_i10.ResetUsecase>(
      () => _i10.ResetUsecase(get<_i6.CounterRepository>()));
  gh.lazySingleton<_i11.DioErrorHandler<_i11.DefaultApiError>>(
      () => registerModule.makeDioErrorHandler(get<_i9.Logger>()));
  gh.factory<_i12.DioLogger>(() => registerModule.dioLogger(get<_i9.Logger>()));
  gh.factory<_i13.HomeService>(() => _i13.HomeService(
      get<_i8.IncrementUsecase>(),
      get<_i7.DecrementUsecase>(),
      get<_i10.ResetUsecase>()));
  gh.factory<_i14.DioClientCreator>(() => registerModule.dioClientCreator(
      get<_i12.DioLogger>(), get<_i4.LoggerConfiguration>()));
  gh.factory<_i15.HomeBloc>(() => _i15.HomeBloc(get<_i13.HomeService>()));
  await gh.singletonAsync<_i16.Dio>(
      () => registerModule.dio(
          get<_i14.DioClientCreator>(), get<String>(instanceName: 'domain')),
      preResolve: true);
  gh.factory<_i17.HttpClient>(() => _i17.HttpClient.dio(get<_i16.Dio>()));
  return get;
}

class _$RegisterModule extends _i18.RegisterModule {}
