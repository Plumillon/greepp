import 'package:greepp/domain/entities/green_entity.dart';

sealed class GreenState {}

class InitialGreenState extends GreenState {}

class LoadingGreenState extends GreenState {}

class LoadedGreenState extends GreenState {
  final List<GreenEntity> greens;

  LoadedGreenState({required this.greens});
}

class LoadedDetailsGreenState extends GreenState {
  final GreenEntity green;

  LoadedDetailsGreenState({required this.green});
}

class ErrorGreenState extends GreenState {
  final Object error;

  ErrorGreenState({required this.error});
}
