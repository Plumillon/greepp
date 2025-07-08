import '../entities/green_entity.dart';
import '../repositories/green_repository.dart';
import '../use_cases/use_case.dart';

class GetGreensUseCase implements FutureUseCase<void, List<GreenEntity>> {
  final GreenRepository _greenRepository;

  GetGreensUseCase(this._greenRepository);

  @override
  Future<List<GreenEntity>> execute({void param}) {
    return _greenRepository.getGreens();
  }
}
