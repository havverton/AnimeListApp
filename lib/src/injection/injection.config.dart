// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:connectivity/connectivity.dart' as _i5;
import 'package:dio/dio.dart' as _i17;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app/app_module.dart' as _i22;
import '../app/pages/home/bloc/home_bloc.dart' as _i19;
import '../app/pages/home/home_service.dart' as _i18;
import '../app/routing/routing.dart' as _i3;
import '../app/utils/utils.dart' as _i15;
import '../core/core.dart' as _i9;
import '../core/logger/logger.dart' as _i8;
import '../modules/counter/counter_repository.dart' as _i11;
import '../modules/counter/use_cases/decrement_usecase.dart' as _i12;
import '../modules/counter/use_cases/increment_usecase.dart' as _i14;
import '../modules/counter/use_cases/reset_usecase.dart' as _i16;
import '../networking/dio_client_creator.dart' as _i13;
import '../networking/dio_error_handler.dart' as _i6;
import '../networking/dio_logger.dart' as _i7;
import '../networking/networking_module.dart' as _i21;
import '../utils/connectivity_service.dart' as _i4;
import '../utils/runtime_storage.dart' as _i10;
import 'register_module.dart' as _i20; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  final networkingModule = _$NetworkingModule();
  final appModule = _$AppModule();
  gh.lazySingleton<_i3.AppRouter>(() => registerModule.appRouter());
  gh.factory<_i4.ConnectivityService>(
      () => _i4.ConnectivityService.fromConnectivity(get<_i5.Connectivity>()));
  gh.factory<_i6.DioErrorHandler>(
      () => networkingModule.getHandler(get<_i4.ConnectivityService>()));
  gh.factory<_i7.DioLogger>(
      () => networkingModule.getDioLogger(get<_i8.Logger>()));
  gh.factory<_i9.LoggerConfiguration>(() => appModule.loggerConfigurationDev());
  gh.lazySingleton<_i10.RuntimeStorage>(() => _i10.RuntimeStorage());
  gh.factory<_i11.CounterRepository>(
      () => _i11.CounterRepository(get<_i10.RuntimeStorage>()));
  gh.factory<_i12.DecrementUsecase>(
      () => _i12.DecrementUsecase(get<_i11.CounterRepository>()));
  gh.factory<_i13.DioClientCreator>(() => networkingModule.getClientCreator(
      get<_i7.DioLogger>(), get<_i8.LoggerConfiguration>()));
  gh.factory<_i14.IncrementUsecase>(
      () => _i14.IncrementUsecase(get<_i11.CounterRepository>()));
  gh.lazySingleton<_i9.Logger>(
      () => registerModule.logger(get<_i9.LoggerConfiguration>()));
  gh.factory<_i15.LoggerBlocObserver>(
      () => appModule.createBlocLoggerObserver(get<_i9.Logger>()));
  gh.factory<_i16.ResetUsecase>(
      () => _i16.ResetUsecase(get<_i11.CounterRepository>()));
  gh.factory<_i3.RouterLoggingObserver>(() => appModule
      .createRouterLoggingObserver(get<_i9.Logger>(), get<_i3.AppRouter>()));
  await gh.singletonAsync<_i17.Dio>(
      () => networkingModule.getClient(get<_i13.DioClientCreator>()),
      preResolve: true);
  gh.factory<_i18.HomeService>(() => _i18.HomeService(
      get<_i14.IncrementUsecase>(),
      get<_i12.DecrementUsecase>(),
      get<_i16.ResetUsecase>()));
  gh.factory<_i19.HomeBloc>(() => _i19.HomeBloc(get<_i18.HomeService>()));
  return get;
}

class _$RegisterModule extends _i20.RegisterModule {}

class _$NetworkingModule extends _i21.NetworkingModule {}

class _$AppModule extends _i22.AppModule {}
