import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizgames/models/Questions.dart';
import 'package:quizgames/services/total_coins.dart';
import 'package:quizgames/ui/Quiz_screen/bloc/quiz_screen_bloc.dart';
import 'package:quizgames/ui/Quiz_screen/widgets/Question_card.dart';
import 'package:quizgames/ui/Quiz_screen/widgets/options_list.dart';
import 'package:quizgames/ui/Quiz_screen/Result_Screen.dart';

import '../../blocs/Update_Coin_Bloc/update_coin_bloc.dart';
import '../../blocs/authentication_bloc/authentication_bloc.dart';
import '../../blocs/my_user_bloc/my_user_bloc.dart';
import 'widgets/progress_bar.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    super.key,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => QuizScreenBloc(),
      child: SafeArea(
        child: BlocConsumer<QuizScreenBloc, QuizScreenState>(
          listener: (context, state) async {
            if (state.time == 50) {
              setState(() {
                context.read<UpdateCoinBloc>().add(UpdateCoins(
                      score: state.score,
                      userId: context.read<AuthenticationBloc>().state.user!.uid,
                    ));
              });
              await Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (_) => ResultScreen(
                          score: state.score,
                        )),
              );

              context.read<QuizScreenBloc>().add(ResetChooseOption());
              context
                  .read<QuizScreenBloc>()
                  .add(ProgressQuestionsReset());
              context.read<QuizScreenBloc>().add(StopTimer());
            }
          },
          builder: (context, state) {
            return Scaffold(
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
                            context
                                .read<QuizScreenBloc>()
                                .add(ResetChooseOption());
                            context
                                .read<QuizScreenBloc>()
                                .add(ProgressQuestionsReset());
                            context
                                .read<QuizScreenBloc>()
                                .add(StopTimer());
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
                            child: Image.asset(
                                'assets/icons/icons8-multiply-50.png'),
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
                        return Visibility(
                          visible: state.choose,
                          child: InkWell(
                            onTap: () async {
                              if (state.progressQuestion + 1 ==
                                  sample_data.length) {
                                context
                                    .read<UpdateCoinBloc>()
                                    .add(UpdateCoins(
                                      score: state.score,
                                      userId: context
                                          .read<AuthenticationBloc>()
                                          .state
                                          .user!
                                          .uid,
                                    ));

                                context
                                    .read<QuizScreenBloc>()
                                    .add(StopTimer());
                                context
                                    .read<QuizScreenBloc>()
                                    .add(ResetChooseOption());
                                context
                                    .read<QuizScreenBloc>()
                                    .add(ProgressQuestionsReset());
                                context
                                    .read<QuizScreenBloc>()
                                    .add(StopTimer());
                                await Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ResultScreen(
                                            score: state.score,
                                          )),
                                );
                              }

                              setState(() {
                                context
                                    .read<QuizScreenBloc>()
                                    .add(ChooseNext());
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
                                (state.progressQuestion + 1 ==
                                        sample_data.length)
                                    ? 'End'
                                    : 'Next',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19),
                              )),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
