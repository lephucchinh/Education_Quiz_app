import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quizgames/models/Questions.dart';
import 'package:quizgames/ui/Quiz_screen/bloc/quiz_screen_bloc.dart';
import 'package:quizgames/ui/Result_creen/Result_Screen.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard({super.key});

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  void didChangeDependencies() {
    context.read<QuizScreenBloc>().add(StartTimer());
    super.didChangeDependencies();
  }

  @override

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocBuilder<QuizScreenBloc, QuizScreenState>(
      builder: (context, state) {
        return Stack(
          children: [
            SizedBox(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: size.width * 0.9,
                    height: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.lightBlueAccent.withOpacity(0.3),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      child: Text(
                        sample_data[state.progressQuestion]["question"],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: CircleAvatar(
                  maxRadius: 35,
                  backgroundColor: Colors.white,
                  child: CircularPercentIndicator(
                    radius: 30,
                    lineWidth: 5.0,
                    percent: state.progressTime,
                    center: Text('${state.time}'),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.lightBlue,
                    backgroundColor: Colors.grey,
                  ),
                ))
          ],
        );
      },
    );
  }
}
