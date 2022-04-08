import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../arch/dio_packages/dio_packages.dart';
import 'dio_logger.dart';

///Create Dio-client abstraction
abstract class DioClientCreator {
  ///Returns Dio http client
  Future<Dio> create(String url);
}

class DioClientCreatorImpl implements DioClientCreator {
  const DioClientCreatorImpl({
    required this.logger,
    this.enableLogs = false,
  });

  static const defaultConnectTimeout = 5000;
  static const defaultReceiveTimeout = 25000;

  @protected
  final bool enableLogs;
  @protected
  final DioLogger logger;

  @override
  Future<Dio> create(String url) => _baseDio(url);

  Future<Dio> _baseDio(final String url) async {
    final startDio = Dio();

    startDio.options.baseUrl = url;
    startDio.options.connectTimeout = defaultConnectTimeout;
    startDio.options.receiveTimeout = defaultReceiveTimeout;

    if (enableLogs) {
      startDio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          logPrint: logger.log,
        ),
      );
    }

    startDio.transformer = FlutterTransformer();
    return startDio;
  }
}
