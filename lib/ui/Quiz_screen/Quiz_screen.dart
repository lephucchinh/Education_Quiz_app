import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizgames/models/Questions.dart';
import 'package:quizgames/ui/Quiz_screen/bloc/quiz_screen_bloc.dart';
import 'package:quizgames/ui/Quiz_screen/widgets/Question_card.dart';
import 'package:quizgames/ui/Quiz_screen/widgets/options_list.dart';
import 'package:quizgames/ui/Result_creen/Result_Screen.dart';

import 'widgets/progress_bar.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: BlocListener<QuizScreenBloc, QuizScreenState>(
        listener: (context, state) {
          if (state.time == 50) {
            context.read<QuizScreenBloc>().add(ResetChooseOption());
            context.read<QuizScreenBloc>().add(ProgressQuestionsReset());
            context.read<QuizScreenBloc>().add(StopTimer());
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => ResultScreen()),
              (route) => false,
            );
          }
        },
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<QuizScreenBloc>().add(ResetChooseOption());
                        context
                            .read<QuizScreenBloc>()
                            .add(ProgressQuestionsReset());
                        context.read<QuizScreenBloc>().add(StopTimer());
                        Navigator.pop(context);
                        print('pop');
                      },
                      child: Container(
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              width: 2,
                              color: Colors.black,
                            )),
                        child:
                            Image.asset('assets/icons/icons8-multiply-50.png'),
                      ),
                    ),
                    ProgressBar(),
                  ],
                ),
                const SizedBox(
                  height: 45,
                ),
                QuestionCard(),
                OptionsList(),
                BlocBuilder<QuizScreenBloc, QuizScreenState>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        if (state.progressQuestion + 1 == sample_data.length) {
                          context
                              .read<QuizScreenBloc>()
                              .add(ResetChooseOption());
                          context
                              .read<QuizScreenBloc>()
                              .add(ProgressQuestionsReset());
                          context.read<QuizScreenBloc>().add(StopTimer());
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => ResultScreen()),
                            (route) => false,
                          );
                        }
                        setState(() {
                          context
                              .read<QuizScreenBloc>()
                              .add(ProgressQuestionsIncrease());
                        });
                      },
                      child: Container(
                        width: size.width * 0.85,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.cyan,
                        ),
                        child: Center(
                            child: Text(
                          (state.progressQuestion + 1 == sample_data.length)
                              ? 'End'
                              : 'Next',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        )),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
