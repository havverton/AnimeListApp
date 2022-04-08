import '../logger/logger.dart';

class DioLogger {
  const DioLogger(this.logger);

  final Logger logger;

  void log(Object o) => logger.debug(o);
}
