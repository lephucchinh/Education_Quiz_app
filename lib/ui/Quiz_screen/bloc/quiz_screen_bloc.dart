import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'quiz_screen_event.dart';

part 'quiz_screen_state.dart';

class QuizScreenBloc extends Bloc<QuizScreenEvent, QuizScreenState> {
  QuizScreenBloc() : super(QuizScreenState.initial()) {
    on<StartTimer>(_onStartTimer);
    on<StopTimer>(_onStopTimer);
    on<TimerLoader>(_onTimerLoader);
    on<ProgressQuestionsIncrease>(_onProgressQuestionsIncrease);
    on<ProgressQuestionsReset>(_onProgressQuestionsReset);
    on<ChooseOption>(_onChooseOption);
    on<ResetChooseOption>(_onResetChooseOption);
    on<CountScore>(_onCountScore);
    on<ResetScore>(_onResetScore);
  }

///////////////////////////////////////////////////

  late Timer _timer;
  double progressTime = 0;
  int time = 0;
  int millisecond = 0;
  int progressQuestion = 0;
  int numberChoose = 0;
  int score = 0;

  //////////////////////////////////////////////////

  _onStartTimer(StartTimer event, Emitter<QuizScreenState> emit) {
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (progressTime < 1) {
        add(TimerLoader(
          time: time,
          progressTime: progressTime,
        ));
        progressTime += 0.002;
        millisecond += 100;
        if (millisecond >= 1000) {
          time += 1;
          millisecond = 0;
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

  _onProgressQuestionsReset(
      ProgressQuestionsReset event, Emitter<QuizScreenState> emit) {
    progressQuestion = 0;
    emit(state.copyWith(progressQuestion: progressQuestion));
  }

  _onTimerLoader(TimerLoader event, Emitter<QuizScreenState> emit) {
    emit(state.copyWith(time: event.time, progressTime: event.progressTime));
  }

  _onChooseOption(ChooseOption event, Emitter<QuizScreenState> emit) {
    if (numberChoose == progressQuestion) {
      numberChoose += 1;
      emit(
        state.copyWith(
            numberChoose: numberChoose,
            idOptionChoose: event.indexChoose,
            idAnswer: event.indexAnswer),
      );
      if (state.idAnswer == state.idOptionChoose) {
        add(CountScore());
      }
    }
  }

  _onResetChooseOption(ResetChooseOption event, Emitter<QuizScreenState> emit) {
    numberChoose = 0;
    emit(state.copyWith(numberChoose: numberChoose));
  }

  _onCountScore(CountScore event, Emitter<QuizScreenState> emit) {
    score += 1;
    emit(state.copyWith(score: score));
    print('score: ${state.score}');
  }

  _onResetScore(ResetScore event, Emitter<QuizScreenState> emit) {
    score = 0;
    emit(state.copyWith(score: score));
    print('score: ${state.score}');
  }
}
