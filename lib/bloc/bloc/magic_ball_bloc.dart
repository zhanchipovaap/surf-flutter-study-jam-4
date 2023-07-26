// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

part 'magic_ball_event.dart';
part 'magic_ball_state.dart';

class MagicBallBloc extends Bloc<MagicBallEvent, MagicBallState> {
  MagicBallBloc() : super(MagicBallInitialState()) {
    on<MagicBallLoadinglEvent>(_doLoad);
    on<MagicBallErrorEvent>(_trowError);
  }

  _doLoad(MagicBallLoadinglEvent event, Emitter emit) async {
    final dio = Dio();
    try{
      final response = await dio.get('https://www.eightballapi.com/api');
      emit(MagicBallAnswerState(response.data['reading']));
    }catch(e){
      emit(MagicBallErrorState());
    }

  }
  _trowError(MagicBallErrorEvent event, Emitter emit) {

  }
}
