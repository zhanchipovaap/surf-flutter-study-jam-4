import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'magic_ball_event.dart';
part 'magic_ball_state.dart';

class MagicBallBloc extends Bloc<MagicBallEvent, MagicBallState> {
  MagicBallBloc() : super(MagicBallInitialState()) {
    on<MagicBallEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
