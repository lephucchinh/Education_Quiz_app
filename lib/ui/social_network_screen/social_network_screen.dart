import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_repository/post_repository.dart';
import 'package:quizgames/blocs/create_image_post_bloc/create_image_post_bloc.dart';
import 'package:quizgames/blocs/delete_post_bloc/delete_post_bloc.dart';
import 'package:quizgames/blocs/delete_post_bloc/delete_post_bloc.dart';
import 'package:quizgames/blocs/get_post_bloc/get_post_bloc.dart';
import 'package:quizgames/blocs/get_post_bloc/get_post_bloc.dart';
import 'package:quizgames/ui/social_network_screen/Chat_screen/chat_screen.dart';
import 'package:quizgames/ui/social_network_screen/Post_screen/post_screen.dart';
import 'package:quizgames/ui/social_network_screen/widget/chat_post.dart';
import 'package:user_repository/user_repository.dart';

import '../../blocs/authentication_bloc/authentication_bloc.dart';
import '../../blocs/create_post_bloc/create_post_bloc.dart';
import '../../blocs/get_all_user_chat/get_all_user_bloc.dart';
import '../../blocs/send_push_notification_bloc/send_push_notification_bloc.dart';

class SocialNetworkScreen extends StatefulWidget {
  final MyUser myUser;

  const SocialNetworkScreen({super.key, required this.myUser});

  @override
  State<SocialNetworkScreen> createState() => _SocialNetworkScreenState();
}

class _SocialNetworkScreenState extends State<SocialNetworkScreen> {
  late Post post;

  @override
  void initState() {
    post = Post.empty;
    post.myUser = widget.myUser;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                create: (context) => CreatePostBloc(
                                    myPostRepository: FireBasePostRepository()),
                              ),
                            ],
                            child: PostScreen(
                              post: post,
                              myUser: widget.myUser,
                            ),
                          )));
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ChatScreen(
                        myUser: widget.myUser,
                      )));
            },
            child: const Icon(Icons.message_outlined),
          ),
        ],
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: const Text("Post global"),
        centerTitle: true,
      ),
      body: BlocBuilder<GetPostBloc, GetPostState>(
        builder: (context, state) {
          if (state is GetPostSuccess) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ChatPost(
                      post: state.posts[index],
                      myUser: widget.myUser,
                    ),
                    if (index == state.posts.length - 1)
                      SizedBox(
                        height: 150,
                      ),
                  ],
                );
              },
            );
          } else {
            return const Center(
              child: Text("An error has occured"),
            );
          }
        },
      ),
    );
  }
}
