part of 'home_bloc.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.value(int value) = Value;
  const factory HomeState.loading() = Loading;
}
