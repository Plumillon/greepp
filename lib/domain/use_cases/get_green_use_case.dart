import '../entities/green_entity.dart';
import '../repositories/green_repository.dart';
import '../use_cases/use_case.dart';

class GetGreenUseCase implements FutureUseCase<String, GreenEntity> {
  final GreenRepository _greenRepository;

  GetGreenUseCase(this._greenRepository);

  @override
  Future<GreenEntity> execute({required String param}) {
    return _greenRepository.getGreen(id: param);
  }
}
