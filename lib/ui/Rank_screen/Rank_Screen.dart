import 'package:flutter/material.dart';
import 'package:quizgames/ui/Rank_screen/widgets/card_rank.dart';
import 'package:quizgames/ui/login_screen/Login_screen.dart';

class RankScreen extends StatefulWidget {
  const RankScreen({super.key});

  @override
  State<RankScreen> createState() => _RankScreenState();
}

class _RankScreenState extends State<RankScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.25,
                width: size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFABEBC6),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_ios_new)),
                        const Text('Coins Rankings'),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => LoginScreen()));
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              color: Colors.limeAccent,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            width: 40,
                            height: 40,
                            child: Icon(Icons.output),
                          ),
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 100,
                      height: 140,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            child: Image.asset('assets/icons/icons8-avatar-96.png'),
                            maxRadius: 40,
                          ),
                          Text('1')
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  CardRank(
                    image: 'assets/icons/icons8-avatar-96.png',
                    text: 'john',
                    press: () {},
                    index: 1,
                    coin: 10,
                  ),
                  Divider(),
                  CardRank(
                    image: 'assets/icons/icons8-avatar-96.png',
                    text: 'john',
                    press: () {},
                    index: 1,
                    coin: 10,
                  ),
                  Divider(),
                  CardRank(
                    image: 'assets/icons/icons8-avatar-96.png',
                    text: 'john',
                    press: () {},
                    index: 1,
                    coin: 10,
                  ),
                  Divider(),
                  CardRank(
                    image: 'assets/icons/icons8-avatar-96.png',
                    text: 'john',
                    press: () {},
                    index: 1,
                    coin: 10,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
