import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../home_service.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.service) : super(const HomeState.loading()) {
    on<Initialize>((event, emit) async {
      emit(const HomeState.loading());

      final value = await service.getCounter();

      emit(HomeState.value(value));
    });

    on<Increment>((event, emit) async {
      emit(const HomeState.loading());
      final value = await service.increment();
      emit(HomeState.value(value));
    });

    on<Decrement>((event, emit) async {
      emit(const HomeState.loading());
      final value = await service.decrement();
      emit(HomeState.value(value));
    });

    on<Reset>((event, emit) async {
      emit(const HomeState.loading());
      final value = await service.reset();
      emit(HomeState.value(value));
    });

    add(const HomeEvent.initialize());
  }

  final HomeService service;
}
