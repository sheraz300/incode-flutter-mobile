part of 'utils.dart';

late logger.Logger _logger, _logger5, _logger10;

logger.Logger get log => _logger;

logger.Logger get log5 => _logger5;

logger.Logger get log10 => _logger10;

class Logger {
  Logger._();

  static void configure() {
    _logger = logger.Logger(
      printer: logger.PrettyPrinter(methodCount: 0),
    );
    _logger5 = logger.Logger(
      printer: logger.PrettyPrinter(methodCount: 5),
    );
    _logger10 = logger.Logger(
      printer: logger.PrettyPrinter(methodCount: 10),
    );
  }
}