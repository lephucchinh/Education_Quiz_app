part of 'quiz_screen_bloc.dart';

abstract class QuizScreenEvent extends Equatable {
  const QuizScreenEvent();
}

class TimerLoader extends QuizScreenEvent {
  const TimerLoader({
    required this.time,
    required this.progressTime,
  });

  final double progressTime;

  final int time;

  @override
  List<Object?> get props => [time, progressTime];
}

class StartTimer extends QuizScreenEvent {
  @override
  List<Object?> get props => [];
}

class StopTimer extends QuizScreenEvent {
  @override
  List<Object?> get props => [];
}

class ProgressQuestionsIncrease extends QuizScreenEvent {
  @override
  List<Object?> get props => [];
}

class ProgressQuestionsReset extends QuizScreenEvent {
  @override
  List<Object?> get props => [];
}

class ChooseOption extends QuizScreenEvent {
  const ChooseOption({required this.indexAnswer, required this.indexChoose});

  final int indexChoose;
  final int indexAnswer;

  @override
  List<Object?> get props => [indexAnswer, indexChoose];
}

class ResetChooseOption extends QuizScreenEvent {
  @override
  List<Object?> get props => [];
}

class CountScore extends QuizScreenEvent {
  @override
  List<Object?> get props => [];
}

class ResetScore extends QuizScreenEvent {
  @override
  List<Object?> get props => [];
}

class ChooseNext extends QuizScreenEvent {
  @override
  List<Object?> get props => [];
}

class UpdateCoin extends QuizScreenEvent {
  final String username;
  final int score;

  const UpdateCoin({required this.score, required this.username});

  @override
  List<Object?> get props => [username, score];
}

class RandomQuizBloc extends QuizScreenEvent {
  final int topIndex;
  final int bottomIndex;

   const RandomQuizBloc({required this.topIndex,
      required this.bottomIndex,
      });

  @override
  List<Object?> get props => [topIndex, bottomIndex];
}
