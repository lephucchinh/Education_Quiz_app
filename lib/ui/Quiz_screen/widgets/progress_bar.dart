import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizgames/models/Questions.dart';
import 'package:quizgames/ui/Quiz_screen/bloc/quiz_screen_bloc.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({
    super.key,
  });

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  void initState() {
    super.initState();
    context.read<QuizScreenBloc>().add(ProgressQuestionsReset());
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocBuilder<QuizScreenBloc, QuizScreenState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          width: size.width * 0.8,
          height: 35,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12,width: 2,),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                      )
                    ]),
                width: size.width * 0.6,
                height: 10,
                child: LinearProgressIndicator(
                  minHeight: 10,

                  valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                  backgroundColor: Colors.grey,
                  value: (state.progressQuestion + 1) / sample_data.length,
                ),
              ),
              Text(
                '${state.progressQuestion + 1}/${sample_data.length}',
                style: TextStyle(
                    color: Colors.blueAccent, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }
}
