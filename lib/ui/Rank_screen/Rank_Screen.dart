import 'package:flutter/material.dart';
import 'package:quizgames/ui/Rank_screen/widgets/card_rank.dart';

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
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: const Text(
          'Coins Rankings',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.25,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: EdgeInsets.only(top: 40),
                          width: 100,
                          height: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                child: Image.asset(
                                    'assets/icons/icons8-avatar-96.png'),
                                maxRadius: 40,
                              ),
                              Text('1')
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
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
                                child: Image.asset(
                                    'assets/icons/icons8-avatar-96.png'),
                                maxRadius: 40,
                              ),
                              Text('1')
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: 100,
                          height: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                child: Image.asset(
                                    'assets/icons/icons8-avatar-96.png'),
                                maxRadius: 40,
                              ),
                              Text('1')
                            ],
                          ),
                        )
                      ],
                    ),
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
