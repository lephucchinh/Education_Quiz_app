import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizgames/ui/Home_screen/bloc/home_screen_bloc.dart';
import 'package:quizgames/ui/Quiz_screen/Quiz_screen.dart';
import 'package:quizgames/ui/Quiz_screen/bloc/quiz_screen_bloc.dart';

import 'widgets/subjects.dart';

class ListCardSubjects extends StatelessWidget {
  final String username;

  const ListCardSubjects({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        return ListView(
          shrinkWrap: true,
          children: [
            Subjects(
              text: 'Maths',
              image: 'assets/icons/icons8-math-100.png',
              press: () async {
                print('navigation');
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => QuizScreen(
                      username: username,
                    ),
                  ),
                );
                context
                    .read<HomeScreenBloc>()
                    .add(LoadCoinsEvent(username: username));
              },
            ),
            Subjects(
              text: 'Chemistry',
              image: 'assets/icons/icons8-chemistry-50.png',
              press: () {},
            ),
            Subjects(
              text: 'English',
              image: 'assets/icons/icons8-english-100.png',
              press: () {},
            ),
            Subjects(
              text: 'Physics',
              image: 'assets/icons/icons8-physics-100.png',
              press: () {},
            ),
          ],
        );
      },
    );
  }
}
