import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  const Display({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi, john',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),
            Text("Let's make this day productive",style: TextStyle(fontWeight: FontWeight.w400),),
          ],
        ),
        GestureDetector(
          onTap: () {
            print('profile');
          },
          child: CircleAvatar(
            maxRadius: 35,
            child: Image.asset('assets/icons/icons8-avatar-96.png',width: 70,),
          ),
        )
      ],
    );
  }
}
