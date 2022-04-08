import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart' as lg;

import '../app/routing/routing.dart';
import '../core/core.dart';
import '../utils/environment_service.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  AppRouter appRouter() => AppRouter();

  @preResolve
  @lazySingleton
  Future<EnvironmentService> getEnvironmentService() async {
    final service = EnvironmentService();

    await service.load();

    return service;
  }

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
