import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../core/logger/logger.dart';
import '../utils/connectivity_service.dart';
import 'dio_client_creator.dart';
import 'dio_error_handler.dart';
import 'dio_logger.dart';

@module
abstract class NetworkingModule {
  @factoryMethod
  Connectivity getConnectivity() => Connectivity();

  @factoryMethod
  DioErrorHandler getHandler(ConnectivityService service) {
    return DioErrorHandler(service);
  }

  @factoryMethod
  DioLogger getDioLogger(Logger logger) {
    return DioLogger(logger);
  }

  @factoryMethod
  DioClientCreator getClientCreator(
    DioLogger logger,
    LoggerConfiguration config,
  ) {
    return DioClientCreator(
      logger: logger,
      enableLogs: config.enableDioLogs,
    );
  }

  @preResolve
  @singleton
  Future<Dio> getClient(DioClientCreator creator) async {
    return creator.create();
  }
}
