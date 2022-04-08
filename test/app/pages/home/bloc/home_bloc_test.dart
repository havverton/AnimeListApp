import 'package:app_template/src/app/pages/home/bloc/home_bloc.dart';
import 'package:app_template/src/app/pages/home/home.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_bloc_test.mocks.dart';

//class MockHomeService extends Mock implements HomeService {}

@GenerateMocks([HomeService])
void main() {
  late MockHomeService mockService;

  setUpAll(() {
    mockService = MockHomeService();
  });

  group('Home Bloc tests', () {
    blocTest<HomeBloc, HomeState>(
      'HomeBloc increment',
      setUp: () {
        when(mockService.increment()).thenAnswer((_) async => 1);

        when(mockService.getCounter()).thenAnswer((_) async => 0);
      },
      build: () => HomeBloc(mockService),
      act: (bloc) => bloc.add(const HomeEvent.increment()),
      expect: () => [
        const HomeState.loading(),
        const HomeState.value(0),
        const HomeState.loading(),
        const HomeState.value(1),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'HomeBloc decrement',
      setUp: () {
        when(mockService.decrement()).thenAnswer((_) async => -1);
        when(mockService.getCounter()).thenAnswer((_) async => 0);
      },
      build: () => HomeBloc(mockService),
      act: (bloc) => bloc.add(const HomeEvent.decrement()),
      expect: () => [
        const HomeState.loading(),
        const HomeState.value(0),
        const HomeState.loading(),
        const HomeState.value(-1),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'HomeBloc reset event',
      setUp: () {
        when(mockService.increment()).thenAnswer((_) async => 1);
        when(mockService.getCounter()).thenAnswer((_) async => 0);

        when(mockService.reset()).thenAnswer((_) async => 0);
      },
      build: () => HomeBloc(mockService),
      act: (bloc) => bloc
        ..add(const HomeEvent.increment())
        ..add(const HomeEvent.reset()),
      expect: () => [
        const HomeState.loading(),
        const HomeState.value(0),
        const HomeState.loading(),
        const HomeState.value(1),
        const HomeState.loading(),
        const HomeState.value(0),
      ],
    );
  });
}
