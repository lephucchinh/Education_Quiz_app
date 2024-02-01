import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizgames/ui/Home_screen/bloc/home_screen_bloc.dart';
import 'package:quizgames/ui/Rank_screen/Rank_Screen.dart';

class Display extends StatelessWidget {
  final String name;
  const Display({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, ${name}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
                Text(
                  "Let's make this day productive",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => RankScreen()));
              },
              child: CircleAvatar(
                maxRadius: 35,
                child: Image.asset(
                  'assets/icons/icons8-avatar-96.png',
                  width: 70,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
