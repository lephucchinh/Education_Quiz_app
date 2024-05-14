import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizgames/app/app_view.dart';
import 'package:quizgames/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:quizgames/services/authentication.dart';
import 'package:quizgames/services/total_coins.dart';

import 'package:user_repository/user_repository.dart';

import '../blocs/update_Online_User/update_online_user_bloc.dart';

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp(this.userRepository, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationBloc>(
            create: (_) =>
                AuthenticationBloc(myUserRepository: userRepository)),

        // RepositoryProvider(create: (_) => AuthenticationService()),
        // RepositoryProvider(create: (_) => TotalCoinsServices()),
      ],
      child: BlocProvider(
        create: (context) =>
            UpdateOnlineUserBloc(myUserRepository: FireBaseUserRepository()),
        child: MyAppView(),
      ),
    );
  }
}
