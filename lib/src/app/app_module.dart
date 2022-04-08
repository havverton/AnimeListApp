import 'package:injectable/injectable.dart';

import '../core/core.dart';
import 'routing/routing.dart';
import 'utils/utils.dart';

@module
abstract class AppModule {
  @factoryMethod
  LoggerBlocObserver createBlocLoggerObserver(Logger logger) {
    return LoggerBlocObserver(logger);
  }

  @factoryMethod
  RouterLoggingObserver createRouterLoggingObserver(
    Logger logger,
    AppRouter router,
  ) {
    return RouterLoggingObserver(
      logger: logger,
      appRouter: router,
    );
  }

  @factoryMethod
  LoggerConfiguration loggerConfigurationDev() {
    return const LoggerConfiguration(
      enableBlocLogs: true,
      enableDioLogs: true,
      enableRoutingLogs: true,
      logLevel: LogLevel.verbose,
    );
  }
}
