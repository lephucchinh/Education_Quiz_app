import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizgames/services/authentication.dart';
import 'package:quizgames/services/total_coins.dart';
import 'package:quizgames/ui/Home_screen/bloc/home_screen_bloc.dart';
import 'package:quizgames/ui/Home_screen/widgets/card_index.dart';
import 'package:quizgames/ui/Home_screen/widgets/display.dart';
import 'package:quizgames/ui/Home_screen/widgets/list_card_subjects.dart';

class HomeScreen extends StatefulWidget {
  final String username;

  const HomeScreen({
    super.key,
    required this.username,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final bloc = HomeScreenBloc(
      RepositoryProvider.of<TotalCoinsServices>(context),
      RepositoryProvider.of<AuthenticationService>(context),
  );

  @override
  void initState() {
    bloc..add(LoadCoinsEvent(username: widget.username));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.90),
        body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
          builder: (context, state) {
            if (state is CoinsLoadedState) {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Display(name: state.name,),
                        CardIndex(size: size),
                        Padding(
                          padding: EdgeInsets.all(17),
                          child: Text(
                            "Let's play",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        ListCardSubjects(username: widget.username),
                      ],
                    ),
                  ),
                ),
              );
            } else
              return Container(
                color: Colors.pinkAccent,
              );
          },
        ),
      ),
    );
  }
}
