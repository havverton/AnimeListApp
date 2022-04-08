part of 'home_bloc.dart';

@freezed
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.increment() = Increment;
  const factory HomeEvent.decrement() = Decrement;
  const factory HomeEvent.reset() = Reset;
  const factory HomeEvent.initialize() = Initialize;
}
