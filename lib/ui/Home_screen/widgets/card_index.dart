import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizgames/ui/Home_screen/bloc/home_screen_bloc.dart';

class CardIndex extends StatefulWidget {
  final Size size;

  const CardIndex({super.key, required this.size});

  @override
  State<CardIndex> createState() => _CardIndexState();
}

class _CardIndexState extends State<CardIndex> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        return Container(
            height: 70,
            width: widget.size.width * 0.9,
            margin: EdgeInsets.symmetric(vertical: 17),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      print('ranking');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          'assets/icons/champions cup.png',
                          width: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ranking',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '100',
                              style: TextStyle(
                                  color: Colors.pinkAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                VerticalDivider(),
                Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          'assets/icons/dollar.png',
                          width: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Coins',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${state.coinsAchieve.toInt()}',
                              style: TextStyle(
                                  color: Colors.pinkAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    )),
              ],
            ));
      },
    );
  }
}
