import 'package:greepp/domain/entities/green_entity.dart';
import 'package:greepp/domain/exceptions/green_exception.dart';
import 'package:greepp/domain/repositories/green_repository.dart';

import '../data_sources/local_data_source.dart';
import '../data_sources/mappers/green_data_mapper.dart';

class GreenRepositoryImpl implements GreenRepository {
  final LocalDataSource _dataSource;
  final GreenDataMapper _mapper;

  GreenRepositoryImpl(
    this._dataSource,
    this._mapper,
  );

  @override
  Future<List<GreenEntity>> getGreens() {
    return _dataSource
        .getGreens()
        .then((items) => items.map((item) => _mapper.mapTo(item)).toList());
  }

  @override
  Future<GreenEntity> getGreen({required String id}) {
    return _dataSource.getGreen(id: id).then((item) {
      if (item == null) {
        throw NotFoundGreenException(id: id);
      }

      return _mapper.mapTo(item);
    });
  }
}
