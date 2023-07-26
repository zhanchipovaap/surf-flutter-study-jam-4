part of 'magic_ball_bloc.dart';

@immutable
abstract class MagicBallEvent {}

class MagicBallInitialEvent extends MagicBallEvent {}

class MagicBallLoadinglEvent extends MagicBallEvent {}

class MagicBallLoadedEvent extends MagicBallEvent {}

class MagicBallErrorEvent extends MagicBallEvent {}