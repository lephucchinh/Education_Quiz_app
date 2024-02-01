import 'package:flutter/material.dart';

class CardRank extends StatelessWidget {
  final String image;
  final String text;
  final Function() press;
  final int index;
  final int coin;

  const CardRank(
      {super.key,
      required this.image,
      required this.text,
      required this.press,
      required this.index,
      required this.coin});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: Text('${index}'),
      title: Row(
        children: [
          CircleAvatar(
            child: Image.asset(
              'assets/icons/icons8-avatar-96.png',
            ),
          ),
          SizedBox(width: 20,),
          Text(
            text,
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
      trailing: Text(
        '${coin}',
        style: TextStyle(
          fontSize: 20,
            fontWeight: FontWeight.bold, color: Colors.blueAccent),
      ),
    );
  }
}
