import 'package:logger/logger.dart';

import 'di/injector.dart';

Logger getLogger() {
  return getIt<Logger>();
}
