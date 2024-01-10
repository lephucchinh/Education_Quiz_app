part of 'quiz_screen_bloc.dart';

abstract class QuizScreenEvent extends Equatable {
  const QuizScreenEvent();
}

class StartTimer extends QuizScreenEvent {
  @override
  List<Object?> get props => [];
}

class StopTimer extends QuizScreenEvent {
  @override
  List<Object?> get props => [];

}
