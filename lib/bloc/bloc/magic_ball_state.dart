part of 'magic_ball_bloc.dart';

@immutable
abstract class MagicBallState {}

class MagicBallInitialState extends MagicBallState {}

// ignore: must_be_immutable
class MagicBallAnswerState extends MagicBallState {
  String text;
  MagicBallAnswerState(this.text);
}

class MagicBallErrorState extends MagicBallState {}
