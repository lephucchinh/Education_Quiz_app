import 'package:flutter/material.dart';
import 'package:quizgames/ui/Quiz_screen/widgets/option_card.dart';

class OptionsList extends StatefulWidget {
  const OptionsList({super.key});

  @override
  State<OptionsList> createState() => _OptionsListState();
}

class _OptionsListState extends State<OptionsList> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: 350,
      width: size.width * 0.85,
      child: ListView.builder(
        itemCount: 4,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return  OptionCard(size: size);
        },
      ),
    );
  }
}
