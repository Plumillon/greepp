abstract class CoreLogger {
  void t(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  });

  void d(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  });

  void i(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  });

  void w(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  });

  void e(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  });

  void f(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  });
}

// Avoid crashing if logger is not defined
class NoLogger extends CoreLogger {
  @override
  void d(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {}

  @override
  void e(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {}

  @override
  void i(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {}

  @override
  void t(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {}

  @override
  void w(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {}

  @override
  void f(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {}
}

class Domain {
  static bool logEnabled = false;
  static CoreLogger? logger;
}

CoreLogger logger() =>
    Domain.logEnabled ? Domain.logger ?? NoLogger() : NoLogger();
