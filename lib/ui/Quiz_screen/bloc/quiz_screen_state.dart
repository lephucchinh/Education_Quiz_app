part of 'quiz_screen_bloc.dart';

class QuizScreenState extends Equatable {
  const QuizScreenState._({required this.progressTime, required this.time });


  const QuizScreenState.initial({this.progressTime  = 0.0, this.time = 0});


  final int time;
  final double progressTime;

  QuizScreenState copyWith({int? time, double? progressTime}) {
    return QuizScreenState._(
      time: time ?? this.time,
      progressTime: progressTime ?? this.progressTime,
    );
  }

  @override
  List<Object?> get props => [time,progressTime];
}
