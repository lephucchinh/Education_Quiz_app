import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizgames/models/Questions.dart';

import '../bloc/quiz_screen_bloc.dart';

class OptionCard extends StatefulWidget {
  final int index;
  final Size size;

  const OptionCard({super.key, required this.size, required this.index});

  @override
  State<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizScreenBloc, QuizScreenState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            setState(() {
              context.read<QuizScreenBloc>().add(ChooseOption(
                  indexAnswer: sample_data[state.progressQuestion]
                      ['answer_index'],
                  indexChoose: widget.index));
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: widget.size.width * 0.85,
            height: 55,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: (state.numberChoose > state.progressQuestion &&
                        widget.index != state.idAnswer &&
                        widget.index == state.idAnswer)
                    ? Colors.grey
                    : (state.numberChoose > state.progressQuestion &&
                            widget.index == state.idAnswer)
                        ? Colors.blueAccent
                        : (state.numberChoose > state.progressQuestion &&
                                widget.index != state.idAnswer &&
                                widget.index == state.idOptionChoose)
                            ? Colors.red
                            : (state.numberChoose > state.progressQuestion &&
                                    widget.index == state.idAnswer &&
                                    state.idAnswer == state.idOptionChoose)
                                ? Colors.red
                                : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    sample_data[state.progressQuestion]['options']
                        [widget.index],
                    style: TextStyle(
                        color: (state.numberChoose > state.progressQuestion &&
                                widget.index != state.idAnswer &&
                                widget.index == state.idAnswer)
                            ? Colors.grey
                            : (state.numberChoose > state.progressQuestion &&
                                    widget.index == state.idAnswer)
                                ? Colors.blueAccent
                                : (state.numberChoose >
                                            state.progressQuestion &&
                                        widget.index != state.idAnswer &&
                                        widget.index == state.idOptionChoose)
                                    ? Colors.red
                                    : (state.numberChoose >
                                                state.progressQuestion &&
                                            widget.index == state.idAnswer &&
                                            state.idAnswer ==
                                                state.idOptionChoose)
                                        ? Colors.red
                                        : Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                (state.numberChoose > state.progressQuestion &&
                        widget.index != state.idAnswer &&
                        widget.index == state.idAnswer)
                    ? Padding(
                        padding: EdgeInsets.only(right: 25),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      )
                    : (state.numberChoose > state.progressQuestion &&
                            widget.index == state.idAnswer)
                        ? Padding(
                            padding: EdgeInsets.only(right: 25),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Image.asset(
                                'assets/icons/icons8-correct-40.png',
                                width: 35,
                              ),
                            ),
                          )
                        : (state.numberChoose > state.progressQuestion &&
                                widget.index != state.idAnswer &&
                                widget.index == state.idOptionChoose)
                            ? Padding(
                                padding: EdgeInsets.only(right: 25),
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    border: Border.all(color: Colors.red),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Image.asset(
                                    'assets/icons/icons8-wrong-96.png',
                                    width: 35,
                                  ),
                                ),
                              )
                            : (state.numberChoose > state.progressQuestion &&
                                    widget.index == state.idAnswer &&
                                    state.idAnswer == state.idOptionChoose)
                                ? Padding(
                                    padding: EdgeInsets.only(right: 25),
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Image.asset(
                                        'assets/icons/icons8-correct-40.png',
                                        width: 35,
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: EdgeInsets.only(right: 25),
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),

                // Image.asset('assets/icons/icons8-wrong-96.png',width: 35,),
              ],
            ),
          ),
        );
      },
    );
  }
}
