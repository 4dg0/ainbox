import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

final logger = Logger(level: _getLogLevel());

Level _getLogLevel() {
  final logLevel = dotenv.env['LOG_LEVEL']?.toLowerCase() ?? 'info';

  switch (logLevel) {
    case 'debug':
      return Level.debug;
    case 'info':
      return Level.info;
    case 'warning':
      return Level.warning;
    case 'error':
      return Level.error;
    case 'off':
      return Level.off;
    default:
      return Level.info;
  }
}
