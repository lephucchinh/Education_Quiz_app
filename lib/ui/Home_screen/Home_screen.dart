import 'package:flutter/material.dart';
import 'package:quizgames/ui/Home_screen/widgets/card_index.dart';
import 'package:quizgames/ui/Home_screen/widgets/display.dart';
import 'package:quizgames/ui/Home_screen/widgets/list_card_subjects.dart';

import 'widgets/widgets/subjects.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.90),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40,),
                Display(),
                CardIndex(size: size),

                Padding(
                  padding: EdgeInsets.all(17),
                  child: Text(
                    "Let's play",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),

                ListCardSubjects(),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
