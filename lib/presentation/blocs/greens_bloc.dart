import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greepp/domain/use_cases/get_greens_use_case.dart';

import '../events/green_event.dart';
import '../states/green_state.dart';

class GreensBloc extends Bloc<GreenEvent, GreenState> {
  final GetGreensUseCase _getGreensUseCase;

  GreensBloc(this._getGreensUseCase) : super(InitialGreenState()) {
    on<LoadGreenEvent>((_, emitter) {
      emitter(LoadingGreenState());

      /// For the purpose of the example, we are skipping the mapping to model step
      return _getGreensUseCase.execute().then((greens) {
        emitter(LoadedGreenState(greens: greens));
      }).catchError((error) {
        emitter(ErrorGreenState(error: error));
      });
    });
  }
}
