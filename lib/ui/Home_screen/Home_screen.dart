import 'package:comment_repository/comment_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_repository/post_repository.dart';
import 'package:quizgames/blocs/Update_User_Info_Bloc/update_user_info_bloc.dart';
import 'package:quizgames/blocs/Update_User_Info_Bloc/update_user_info_bloc.dart';
import 'package:quizgames/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:quizgames/blocs/delete_post_bloc/delete_post_bloc.dart';
import 'package:quizgames/blocs/get_post_bloc/get_post_bloc.dart';
import 'package:quizgames/blocs/likes_Post/likes_post_bloc.dart';
import 'package:quizgames/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:quizgames/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:quizgames/domain/user.dart';
import 'package:quizgames/services/authentication.dart';
import 'package:quizgames/services/total_coins.dart';
import 'package:quizgames/ui/Home_screen/widgets/card_index.dart';
import 'package:quizgames/ui/Home_screen/widgets/display.dart';
import 'package:quizgames/ui/Home_screen/widgets/list_card_subjects.dart';
import 'package:quizgames/ui/social_network_screen/social_network_screen.dart';
import 'package:user_repository/user_repository.dart';

import '../../blocs/Update_Coin_Bloc/update_coin_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () async {
          context.read<GetPostBloc>().add(StreamGetPost());
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (context) => DeletePostBloc(
                                myPostRepository: FireBasePostRepository(),
                                ),
                          ),

                        ],
                        child: SocialNetworkScreen(
                            myUser: context.read<MyUserBloc>().state.user!),
                      )));
        },
        child: const Icon(
          Icons.newspaper,
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.read<SignInBloc>().add(SignOutRequired());
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Display(name: "john"),
                CardIndex(
                  size: size,
                ),
                Padding(
                  padding: EdgeInsets.all(17),
                  child: Text(
                    "Let's play",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                ListCardSubjects(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
