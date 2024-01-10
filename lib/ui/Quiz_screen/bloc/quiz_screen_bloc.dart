import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'quiz_screen_event.dart';

part 'quiz_screen_state.dart';

class QuizScreenBloc extends Bloc<QuizScreenEvent, QuizScreenState> {
  QuizScreenBloc() : super(QuizScreenState.initial()) {
    on<StartTimer>(_onStartTimer);
    on<StopTimer>(_onStopTimer);
    on<TimerLoader>(_onTimerLoader);
    on<ProgressQuestionsIncrease>(_onProgressQuestionsIncrease);
    on<ProgressQuestionsReset>(_onProgressQuestionsReset);
  }

///////////////////////////////////////////////////

  late Timer _timer;
  double progressTime = 0;
  int time = 0;
  int millisecond = 0;
  int progressQuestion = 1;


  /////////////////////////////////////////////////
  _onStartTimer(StartTimer event, Emitter<QuizScreenState> emit) {
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      if (progressTime < 1) {
        add(TimerLoader(
          time: time,
          progressTime: progressTime,
        ));
        progressTime += 0.0002;
        millisecond += 10;
        if (millisecond % 1000 == 0) {
          time += 1;
          add(TimerLoader(
            time: time,
            progressTime: progressTime,
          ));
        }
      } else {
        add(StopTimer());
      }
    });
  }

  _onStopTimer(StopTimer event, Emitter<QuizScreenState> emit) {
    _timer.cancel();
    progressTime = 0;
    time = 0;
  }

  _onProgressQuestionsIncrease(
      ProgressQuestionsIncrease event, Emitter<QuizScreenState> emit) {
    progressQuestion += 1;
     print('$progressQuestion');
    emit(state.copyWith(progressQuestion: progressQuestion));
  }

  _onProgressQuestionsReset(ProgressQuestionsReset event, Emitter<QuizScreenState> emit) {
    progressQuestion  = 1;
    emit(state.copyWith(progressQuestion: progressQuestion));
  }


  _onTimerLoader(TimerLoader event, Emitter<QuizScreenState> emit) {
    emit(state.copyWith(time: event.time, progressTime: event.progressTime));
  }
}
