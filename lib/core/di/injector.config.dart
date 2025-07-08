// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

import '../../data/data_sources/local_data_source.dart' as _i466;
import '../../data/data_sources/mappers/green_data_mapper.dart' as _i28;
import '../../data/repositories/green_repository_impl.dart' as _i252;
import '../../domain/repositories/green_repository.dart' as _i252;
import '../../domain/use_cases/get_green_use_case.dart' as _i669;
import '../../domain/use_cases/get_greens_use_case.dart' as _i611;
import '../../presentation/blocs/green_details_bloc.dart' as _i272;
import '../../presentation/blocs/greens_bloc.dart' as _i949;
import 'injector.dart' as _i811;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  final repositoriesModule = _$RepositoriesModule();
  gh.factory<_i28.GreenDataMapper>(() => _i28.GreenDataMapper());
  gh.factory<_i466.LocalDataSource>(() => _i466.LocalDataSource());
  gh.lazySingleton<_i974.Logger>(() => appModule.logger);
  gh.factory<_i252.GreenRepositoryImpl>(() => _i252.GreenRepositoryImpl(
        gh<_i466.LocalDataSource>(),
        gh<_i28.GreenDataMapper>(),
      ));
  gh.lazySingleton<_i252.GreenRepository>(
      () => repositoriesModule.itemRepository(gh<_i252.GreenRepositoryImpl>()));
  gh.factory<_i669.GetGreenUseCase>(
      () => _i669.GetGreenUseCase(gh<_i252.GreenRepository>()));
  gh.factory<_i611.GetGreensUseCase>(
      () => _i611.GetGreensUseCase(gh<_i252.GreenRepository>()));
  gh.factory<_i949.GreensBloc>(
      () => _i949.GreensBloc(gh<_i611.GetGreensUseCase>()));
  gh.factory<_i272.GreenDetailsBloc>(
      () => _i272.GreenDetailsBloc(gh<_i669.GetGreenUseCase>()));
  return getIt;
}

class _$AppModule extends _i811.AppModule {}

class _$RepositoriesModule extends _i811.RepositoriesModule {}
