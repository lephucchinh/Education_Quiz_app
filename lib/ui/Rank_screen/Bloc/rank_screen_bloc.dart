import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'rank_screen_event.dart';
part 'rank_screen_state.dart';

class RankScreenBloc extends Bloc<RankScreenEvent, RankScreenState> {
  RankScreenBloc() : super(RankScreenInitial()) {
    on<RankScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}