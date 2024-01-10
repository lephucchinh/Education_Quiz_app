part of 'quiz_screen_bloc.dart';

class QuizScreenState extends Equatable {
  const QuizScreenState._(
      {required this.progressQuestion,
      required this.progressTime,
      required this.time});

  const QuizScreenState.initial(
      {this.progressQuestion = 1, this.progressTime = 0.0, this.time = 0});

  final int time;
  final double progressTime;
  final int progressQuestion;

  QuizScreenState copyWith(
      {int? time, double? progressTime, int? progressQuestion}) {
    return QuizScreenState._(
      time: time ?? this.time,
      progressTime: progressTime ?? this.progressTime,
      progressQuestion: progressQuestion ?? this.progressQuestion,
    );
  }

  @override
  List<Object?> get props => [time, progressTime, progressQuestion];
}
