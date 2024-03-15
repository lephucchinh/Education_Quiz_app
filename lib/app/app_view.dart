import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_repository/post_repository.dart';
import 'package:quizgames/blocs/Update_Coin_Bloc/update_coin_bloc.dart';
import 'package:quizgames/blocs/Update_User_Info_Bloc/update_user_info_bloc.dart';
import 'package:quizgames/blocs/delete_post_bloc/delete_post_bloc.dart';
import 'package:quizgames/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:quizgames/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:quizgames/ui/Home_screen/Home_screen.dart';

import '../blocs/authentication_bloc/authentication_bloc.dart';
import '../blocs/get_post_bloc/get_post_bloc.dart';
import '../blocs/likes_Post/likes_post_bloc.dart';
import '../ui/Authentication/welcome_screen.dart';
import 'bloc/app_bloc.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => UpdateCoinBloc(
                  userRepository:
                      context.read<AuthenticationBloc>().userRepository,
                )),
        BlocProvider(
            create: (context) =>
                GetPostBloc(myPostRepository: FireBasePostRepository())),
        BlocProvider(
          create: (context) => LikesPostBloc(
              myPostRepository: FireBasePostRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
            background: Colors.white,
            onBackground: Colors.black,
            primary: Color.fromRGBO(206, 147, 216, 1),
            onPrimary: Colors.black,
            secondary: Color.fromRGBO(244, 143, 177, 1),
            onSecondary: Colors.white,
            tertiary: Color.fromRGBO(255, 204, 128, 1),
            error: Colors.red,
            outline: Color(0xFF424242),
          ),
          useMaterial3: true,
        ),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state.status == AuthenticationStatus.authenticated) {
              return MultiBlocProvider(providers: [
                BlocProvider(
                  create: (context) => SignInBloc(
                      myUserRepository:
                          context.read<AuthenticationBloc>().userRepository),
                ),
                BlocProvider(
                    create: (context) => UpdateUserInfoBloc(
                          userRepository:
                              context.read<AuthenticationBloc>().userRepository,
                        )),
                BlocProvider(
                    create: (context) => MyUserBloc(
                          myUserRepository:
                              context.read<AuthenticationBloc>().userRepository,
                        )..add(GetMyUser(
                            myUserId: context
                                .read<AuthenticationBloc>()
                                .state
                                .user!
                                .uid))),
              ], child: const HomeScreen());
            } else {
              return const WelcomeScreen();
            }
          },
        ),
      ),
    );
  }
}
