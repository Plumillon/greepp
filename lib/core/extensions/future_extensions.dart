import 'package:greepp/domain/logger.dart';

extension CatchLogFuture<T> on Future<T> {
  Future<T> catchLog() => catchError((e) {
        logger().e(e);
      });
}
