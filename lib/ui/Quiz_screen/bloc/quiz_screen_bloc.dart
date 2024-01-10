import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'quiz_screen_event.dart';

part 'quiz_screen_state.dart';

class QuizScreenBloc extends Bloc<QuizScreenEvent, QuizScreenState> {
  QuizScreenBloc() : super( QuizScreenState.initial()) {
    on<StartTimer>(_onStartTimer);
    on<StopTimer>(_onStopTimer);
  }

  late Timer _timer;
  double progressTime = 0;
  int time = 0;


  _onStartTimer(StartTimer event, Emitter<QuizScreenState> emit)  {

    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      if (progressTime < 1) {
        progressTime += 0.0002;
        print('$progressTime');
      }else {
       add(StopTimer());
      }
      emit(state.copyWith(time: time,progressTime: progressTime));
    });
  }
  _onStopTimer(StopTimer event, Emitter<QuizScreenState> emit){
    _timer.cancel();
     progressTime = 0;
     time = 0;
    emit(state.copyWith(time: time,progressTime: progressTime));
  }
}
