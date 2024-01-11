import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizgames/ui/Quiz_screen/Quiz_screen.dart';
import 'package:quizgames/ui/Quiz_screen/bloc/quiz_screen_bloc.dart';

import 'widgets/subjects.dart';

class ListCardSubjects extends StatelessWidget {
  const ListCardSubjects({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizScreenBloc, QuizScreenState>(
      builder: (context, state) {
        return ListView(
          shrinkWrap: true,
          children: [
            Subjects(
              text: 'Maths',
              image: 'assets/icons/icons8-math-100.png',
              press: () {
                print('navigation');
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => QuizScreen()));
              },
            ),
            Subjects(
              text: 'Chemistry',
              image: 'assets/icons/icons8-chemistry-50.png',
              press: () {
              },
            ),
            Subjects(
              text: 'English',
              image: 'assets/icons/icons8-english-100.png',
              press: () {

              },
            ),
            Subjects(
              text: 'Physics',
              image: 'assets/icons/icons8-physics-100.png',
              press: () {

              },
            ),
          ],
        );
      },
    );
  }
}
