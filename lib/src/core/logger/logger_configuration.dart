import 'package:logger/logger.dart';

abstract class LoggerConfiguration {
  const factory LoggerConfiguration({
    bool enableBlocLogs,
    bool enableRoutingLogs,
    bool enableDioLogs,
    LogLevel logLevel,
  }) = _LoggerConfigurationImpl;

  bool get enableBlocLogs;
  bool get enableRoutingLogs;
  bool get enableDioLogs;
  LogLevel get logLevel;
}

class _LoggerConfigurationImpl implements LoggerConfiguration {
  const _LoggerConfigurationImpl({
    this.enableBlocLogs = true,
    this.enableRoutingLogs = true,
    this.enableDioLogs = true,
    this.logLevel = LogLevel.error,
  });

  @override
  final bool enableBlocLogs;
  @override
  final bool enableRoutingLogs;
  @override
  final bool enableDioLogs;
  @override
  final LogLevel logLevel;
}

enum LogLevel {
  verbose,
  debug,
  info,
  warning,
  error,
  nothing,
  wtf,
}

extension LogLevels on LogLevel {
  Level get logeerLevel {
    switch (this) {
      case LogLevel.verbose:
        return Level.verbose;
      case LogLevel.debug:
        return Level.debug;
      case LogLevel.info:
        return Level.info;
      case LogLevel.warning:
        return Level.warning;
      case LogLevel.error:
        return Level.error;
      case LogLevel.wtf:
        return Level.wtf;
      case LogLevel.nothing:
        return Level.nothing;
    }
  }
}
