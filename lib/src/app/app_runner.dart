import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../core/core.dart';
import '../injection/injection.dart';
import 'app.dart';
import 'utils/utils.dart';

class AppRunner extends Runner {
  const AppRunner() : super();

  @override
  Future<void> initDependencies() async {
    await initInjection();
  }

  @override
  void run() {
    runZonedGuarded<void>(
      () {
        final enableBlocLogs = sl<LoggerConfiguration>().enableBlocLogs;
        BlocOverrides.runZoned(
          () => runApp(const App()),
          blocObserver: enableBlocLogs ? sl<LoggerBlocObserver>() : null,
        );
      },
      (error, stack) => sl<Logger>().error('Critical error:', error, stack),
    );
  }
}
