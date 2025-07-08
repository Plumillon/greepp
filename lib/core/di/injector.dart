import 'package:get_it/get_it.dart';
import 'package:greepp/data/repositories/green_repository_impl.dart';
import 'package:greepp/domain/repositories/green_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import 'injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
GetIt configureInjection() => $initGetIt(getIt);

@module
abstract class AppModule {
  @lazySingleton
  Logger get logger => Logger(
        printer: PrettyPrinter(
            methodCount: 2,
            errorMethodCount: 8,
            lineLength: 220,
            colors: true,
            printEmojis: true,
            dateTimeFormat: DateTimeFormat
                .onlyTimeAndSinceStart // Should each log print contain a timestamp
            ),
      );
}

@module
abstract class RepositoriesModule {
  @lazySingleton
  GreenRepository itemRepository(GreenRepositoryImpl repositoryImpl) =>
      repositoryImpl;
}
