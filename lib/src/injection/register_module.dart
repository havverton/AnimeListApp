import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart' as lg;

import '../app/routing/routing.dart';
import '../arch/dio_error_handler/dio_error_handler.dart';
import '../const/const.dart';
import '../core/core.dart';
import '../core/http/dio_client_creator.dart';
import '../core/http/dio_logger.dart';
import '../core/logger/logger_configuration.dart';
import 'injectable_names.dart';

@module
abstract class RegisterModule {
  @Named(InjectableNames.domain)
  String domainUrl() => Constants.domain;

  @lazySingleton
  AppRouter appRouter() => AppRouter();

  @factoryMethod
  LoggerConfiguration loggerConfigurationDev() {
    return const LoggerConfiguration(
      enableBlocLogs: true,
      enableDioLogs: true,
      enableRoutingLogs: true,
      logLevel: LogLevel.verbose,
    );
  }

  // @factoryMethod
  // LoggerConfiguration loggerConfigurationProd() {
  //   return const LoggerConfiguration(
  //     enableBlocLogs: false,
  //     enableDioLogs: false,
  //     enableRoutingLogs: false,
  //     logLevel: LogLevel.error,
  //   );
  // }

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

  @lazySingleton
  DioErrorHandler<DefaultApiError> makeDioErrorHandler(Logger logger) =>
      DioErrorHandlerImpl<DefaultApiError>(
        connectivity: Connectivity(),
        logger: logger,
        parseJsonApiError: (json) async {
          //метод, парсящий ошибку от сервера
          return (json != null) ? DefaultApiError.fromJson(json) : null;
        },
      );

  @factory
  DioLogger dioLogger(Logger logger) {
    return DioLogger(logger);
  }

  @factory
  DioClientCreator dioClientCreator(
      DioLogger logger, LoggerConfiguration configuration) {
    return DioClientCreatorImpl(
      logger: logger,
      enableLogs: configuration.enableDioLogs,
    );
  }

  @singleton
  @preResolve
  Future<Dio> dio(
      DioClientCreator creator, @Named(InjectableNames.domain) String domain) {
    return creator.create(domain);
  }
}
