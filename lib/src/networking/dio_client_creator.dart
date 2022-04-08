import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../arch/dio_packages/dio_packages.dart';
import 'dio_logger.dart';
import 'flutter_transformer.dart';

///Create Dio-client abstraction
abstract class DioClientCreator {
  ///Returns Dio http client
  Dio create([String url]);

  factory DioClientCreator({
    required DioLogger logger,
    bool enableLogs,
  }) = _DioClientCreator;
}

class _DioClientCreator implements DioClientCreator {
  const _DioClientCreator({
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
  Dio create([String? url]) => _baseDio(url);

  Dio _baseDio(String? url) {
    final startDio = Dio();

    if (url != null) {
      startDio.options.baseUrl = url;
    }
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
