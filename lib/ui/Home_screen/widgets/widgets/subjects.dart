import 'package:flutter/material.dart';

class Subjects extends StatelessWidget {
  final String text;
  final String image;
  final Function() press;
  const Subjects({super.key, required this.text, required this.image, required this.press});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 7),
      color: Colors.white,
      child: ListTile(
        onTap: press,
        leading: Image.asset(image),
        title: Text(
          text,
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.pinkAccent),
        ),
        subtitle: Row(
          children: [
            Icon(Icons.question_mark),
            Text('5 Questions'),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.timer_sharp),
            Text('15 mins'),
          ],
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.pinkAccent,
        ),
      ),
    );
  }
}
