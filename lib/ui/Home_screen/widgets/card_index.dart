import 'package:flutter/material.dart';

class CardIndex extends StatelessWidget {
  final Size size;
  const CardIndex({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        width: size.width * 0.9,
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
                          'Ranking',
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
                          'Point',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '12009',
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
  }
}
