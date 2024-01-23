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
      backgroundColor: Colors.white.withOpacity(0.90),
      appBar: AppBar(
        title: Center(child: Text('Coins Rankings')),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        actions: [
          InkWell(
            onTap: () {},
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
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.pink.withOpacity(0.5),

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        maxRadius: 30,
                        child: Image.asset(
                          'assets/icons/icons8-avatar-96.png',
                          width: 80,
                        ),
                      ),
                      title: Text(
                        'john',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      trailing: Text(
                        'No.6',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '0',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  child: Center(
                    child: Text('Top Player'),
                  ),
                )),
            Expanded(
              flex: 8,
              child: ListView(
                children: [
                  CardRank(
                      image: 'assets/icons/icons8-avatar-96.png',
                      text: 'john',
                      press: () {},
                      index: 1,
                      coin: 0),
                  CardRank(
                      image: 'assets/icons/icons8-avatar-96.png',
                      text: 'john',
                      press: () {},
                      index: 1,
                      coin: 0),
                  CardRank(
                      image: 'assets/icons/icons8-avatar-96.png',
                      text: 'john',
                      press: () {},
                      index: 1,
                      coin: 0),
                  CardRank(
                      image: 'assets/icons/icons8-avatar-96.png',
                      text: 'john',
                      press: () {},
                      index: 1,
                      coin: 0),
                  CardRank(
                      image: 'assets/icons/icons8-avatar-96.png',
                      text: 'john',
                      press: () {},
                      index: 1,
                      coin: 0),
                ],
              ),
            ),
            Expanded(flex: 2, child: Container()),
          ],
        ),
      ),
    );
  }
}
