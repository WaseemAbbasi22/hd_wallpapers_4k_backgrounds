import 'package:logger/logger.dart';

abstract class LoggerService {
  void debugLogs(String message);

  void warningLogs(String message);

  void infoLogs(String message);

  void verboseLogs(String message);

  void errorLogs(String message);

  void wtfLogs(String message);
}

class LoggerServiceImp implements LoggerService {
  Logger logger = Logger();

  @override
  void debugLogs(String message) {
    logger.d(message);
  }

  @override
  void errorLogs(String message) {
    logger.e(message);
  }

  @override
  void infoLogs(String message) {
    logger.i(message);
  }

  @override
  void verboseLogs(String message) {
    logger.v(message);
  }

  @override
  void warningLogs(String message) {
    logger.w(message);
  }

  @override
  void wtfLogs(String message) {
    logger.wtf(message);
  }
}
