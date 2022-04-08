import 'package:logger/logger.dart' as logger;

export './logger_configuration.dart';

abstract class Logger {
  const factory Logger(logger.Logger logger) = LoggerImpl;

  void verbose(Object? o, [dynamic error, StackTrace? stackTrace]);
  void debug(Object? o, [dynamic error, StackTrace? stackTrace]);
  void info(Object? o, [dynamic error, StackTrace? stackTrace]);
  void warning(Object? o, [dynamic error, StackTrace? stackTrace]);
  void error(Object? o, [dynamic error, StackTrace? stackTrace]);
  void wtf(Object? o, [dynamic error, StackTrace? stackTrace]);
}

class LoggerImpl implements Logger {
  const LoggerImpl(this._logger);

  final logger.Logger _logger;

  @override
  void debug(Object? o, [dynamic error, StackTrace? stackTrace]) =>
      _logger.d(o, error, stackTrace);

  @override
  void error(Object? o, [dynamic error, StackTrace? stackTrace]) =>
      _logger.e(o, error, stackTrace);

  @override
  void info(Object? o, [dynamic error, StackTrace? stackTrace]) => _logger.i(o);

  @override
  void verbose(Object? o, [dynamic error, StackTrace? stackTrace]) =>
      _logger.v(o, error, stackTrace);
  @override
  void warning(Object? o, [dynamic error, StackTrace? stackTrace]) =>
      _logger.w(o, error, stackTrace);

  @override
  void wtf(Object? o, [dynamic error, StackTrace? stackTrace]) =>
      _logger.wtf(o, error, stackTrace);
}
