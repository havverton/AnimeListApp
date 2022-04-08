// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app/pages/home/bloc/home_bloc.dart' as _i11;
import '../app/pages/home/home_service.dart' as _i10;
import '../core/http/http_client.dart' as _i4;
import '../modules/counter/counter_repository.dart' as _i6;
import '../modules/counter/use_cases/decrement_usecase.dart' as _i7;
import '../modules/counter/use_cases/increment_usecase.dart' as _i8;
import '../modules/counter/use_cases/reset_usecase.dart' as _i9;
import '../utils/runtime_storage.dart' as _i5;
import 'register_module.dart' as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Dio>(() => registerModule.dio());
  gh.factory<_i4.HttpClient>(() => _i4.HttpClient.dio(get<_i3.Dio>()));
  gh.lazySingleton<_i5.RuntimeStorage>(() => _i5.RuntimeStorage());
  gh.factory<_i6.CounterRepository>(
      () => _i6.CounterRepository(get<_i5.RuntimeStorage>()));
  gh.factory<_i7.DecrementUsecase>(
      () => _i7.DecrementUsecase(get<_i6.CounterRepository>()));
  gh.factory<_i8.IncrementUsecase>(
      () => _i8.IncrementUsecase(get<_i6.CounterRepository>()));
  gh.factory<_i9.ResetUsecase>(
      () => _i9.ResetUsecase(get<_i6.CounterRepository>()));
  gh.factory<_i10.HomeService>(() => _i10.HomeService(
      get<_i8.IncrementUsecase>(),
      get<_i7.DecrementUsecase>(),
      get<_i9.ResetUsecase>()));
  gh.factory<_i11.HomeBloc>(() => _i11.HomeBloc(get<_i10.HomeService>()));
  return get;
}

class _$RegisterModule extends _i12.RegisterModule {}
