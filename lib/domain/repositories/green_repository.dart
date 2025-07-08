import '../entities/green_entity.dart';

abstract class GreenRepository {
  Future<List<GreenEntity>> getGreens();

  Future<GreenEntity> getGreen({required String id});
}
