import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greepp/domain/entities/green_entity.dart';
import 'package:greepp/domain/use_cases/get_green_use_case.dart';

import '../events/green_event.dart';
import '../states/green_state.dart';

class GreenDetailsBloc extends Bloc<GreenEvent, GreenState> {
  final GetGreenUseCase _getGreenUseCase;

  GreenEntity? get green => _green;
  GreenEntity? _green;

  GreenDetailsBloc(this._getGreenUseCase) : super(InitialGreenState()) {
    on<LoadDetailsGreenEvent>((event, emitter) async {
      emitter(LoadingGreenState());

      /// For the purpose of the example, we are skipping the mapping to model step
      try {
        _green = await _getGreenUseCase.execute(param: event.id);
        emitter(LoadedDetailsGreenState(green: _green!));
      } catch (error) {
        emitter(ErrorGreenState(error: error));
        return;
      }
    });
  }
}
