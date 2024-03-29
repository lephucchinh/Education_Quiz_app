import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizgames/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:quizgames/ui/Quiz_screen/Quiz_screen.dart';
import 'package:quizgames/ui/Quiz_screen/bloc/quiz_screen_bloc.dart';

import '../../blocs/Update_Coin_Bloc/update_coin_bloc.dart';
import '../../blocs/authentication_bloc/authentication_bloc.dart';
import '../../services/total_coins.dart';

class ResultScreen extends StatelessWidget {
  final int score;

  const ResultScreen({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    return BlocProvider(
      create: (context) => QuizScreenBloc(),
      child: BlocBuilder<QuizScreenBloc, QuizScreenState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<QuizScreenBloc>().add(ResetScore());
                  },
                  icon: Icon(Icons.arrow_back_ios_new)),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Column(
                children: [
                  Text(
                    'Quiz Result',
                    style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Stack(
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            width: size.width * 0.9,
                            height: 180,
                            decoration: BoxDecoration(
                              color:
                              Colors.lightBlueAccent.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/champions cup.png',
                              width: 180,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Congratulations!',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Always be a better version of yourself yesterday.',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Your Score',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5,
                        color: Colors.deepPurple,
                        fontSize: 20),
                  ),
                  RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: '${score}',
                            style: TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold,
                                fontSize: 40)),
                        TextSpan(
                            text: ' / 4',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 40)),
                      ])),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Earned coins',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5,
                        color: Colors.deepPurple,
                        fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/dollar.png',
                        width: 35,
                      ),
                      Text('${score}',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 30)),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 140,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                            child: Text(
                              'Share Result',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Container(
                        width: 140,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.purpleAccent.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                            child: Text(
                              'Take New Quiz',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
