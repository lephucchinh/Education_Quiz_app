import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizgames/blocs/Update_Coin_Bloc/update_coin_bloc.dart';
import 'package:quizgames/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:quizgames/ui/Home_screen/bloc/home_screen_bloc.dart';
import 'package:quizgames/ui/Quiz_screen/bloc/quiz_screen_bloc.dart';
import 'package:quizgames/ui/Quiz_screen/bloc/quiz_screen_bloc.dart';
import 'package:quizgames/ui/Rank_screen/Rank_Screen.dart';
import 'package:user_repository/user_repository.dart';
import 'package:user_repository/user_repository.dart';

import '../../../blocs/my_user_bloc/my_user_bloc.dart';

class CardIndex extends StatefulWidget {
  final Size size;

  const CardIndex({super.key, required this.size});

  @override
  State<CardIndex> createState() => _CardIndexState();
}

class _CardIndexState extends State<CardIndex> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateCoinBloc, UpdateCoinState>(
      listener: (context, state) {
        if (state is UploadCoinSuccess) {
          setState(() {
            context
                .read<MyUserBloc>()
                .state
                .user!
                .coin = state.coin;
          });
        }
      },
      builder: (context, state) {
        return BlocBuilder<MyUserBloc, MyUserState>(
          builder: (context, state) {
            if (state.status == MyUserStatus.success) {
              return Container(
                  height: 70,
                  width: widget.size.width * 0.9,
                  margin: EdgeInsets.symmetric(vertical: 17),
                  decoration: BoxDecoration(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                Navigator.push(
                                    context, MaterialPageRoute(
                                    builder: (_) => RankScreen()));
                              },
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
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
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
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
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround,
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
                                        style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${context
                                            .read<MyUserBloc>()
                                            .state
                                            .user!
                                            .coin}",
                                        style: TextStyle(
                                            color: Colors.pinkAccent,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ],
                      ),
                    ],
                  ));
            } else {
              return Container();
            }
          },
        );
      },
    );
  }
}
