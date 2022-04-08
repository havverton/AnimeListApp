import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart' as lg;

import '../app/routing/routing.dart';
import '../core/core.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  AppRouter appRouter() => AppRouter();

  @lazySingleton
  Logger logger(LoggerConfiguration config) {
    return Logger(
      lg.Logger(
        printer: lg.SimplePrinter(),
        filter: lg.ProductionFilter(),
        level: config.logLevel.logeerLevel,
        output: lg.MultiOutput(
          [
            lg.ConsoleOutput(),
          ],
        ),
      ),
    );
  }
}
