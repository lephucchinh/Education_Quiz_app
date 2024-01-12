part of 'quiz_screen_bloc.dart';

class QuizScreenState extends Equatable {
  const QuizScreenState._({
    required this.numberChoose,
    required this.idAnswer,
    required this.idOptionChoose,
    required this.progressQuestion,
    required this.progressTime,
    required this.time,
    required this.score,
  });

  const QuizScreenState.initial({
    this.numberChoose = 0,
    this.idAnswer = -1,
    this.idOptionChoose = -1,
    this.progressQuestion = 0,
    this.progressTime = 0.0,
    this.time = 0,
    this.score = 0,
  });

  final int time;
  final double progressTime;
  final int progressQuestion;
  final int idOptionChoose;
  final int idAnswer;
  final int numberChoose;
  final int score;

  QuizScreenState copyWith({
    int? time,
    double? progressTime,
    int? progressQuestion,
    int? idOptionChoose,
    int? idAnswer,
    int? numberChoose,
    int? score,
  }) {
    return QuizScreenState._(
        time: time ?? this.time,
        progressTime: progressTime ?? this.progressTime,
        progressQuestion: progressQuestion ?? this.progressQuestion,
        idOptionChoose: idOptionChoose ?? this.idOptionChoose,
        idAnswer: idAnswer ?? this.idAnswer,
        numberChoose: numberChoose ?? this.numberChoose,
        score: score ?? this.score);
  }

  @override
  List<Object?> get props => [
        time,
        progressTime,
        progressQuestion,
        idAnswer,
        idOptionChoose,
        numberChoose,
        score,
      ];
}
