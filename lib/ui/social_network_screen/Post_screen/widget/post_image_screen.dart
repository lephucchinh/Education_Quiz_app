import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_repository/post_repository.dart';
import 'package:quizgames/blocs/create_post_bloc/create_post_bloc.dart';

import '../../../../blocs/create_image_post_bloc/create_image_post_bloc.dart';
import '../../../../blocs/get_all_user_chat/get_all_user_bloc.dart';
import '../../../../blocs/send_push_notification_bloc/send_push_notification_bloc.dart';

class PostImageScreen extends StatefulWidget {
  final String image;
  final Post post;

  const PostImageScreen({super.key, required this.image, required this.post});

  @override
  State<PostImageScreen> createState() => _PostImageScreenState();
}

class _PostImageScreenState extends State<PostImageScreen> {
  final postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bài đăng'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_sharp)),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Image.file(

                  File(widget.image),
                  width: 400,
                  height: 300,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLength: 500,
                  maxLines: 4,
                  controller: postController,
                  decoration: InputDecoration(
                    hintText: "Enter Your Post Here",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary)),
                  ),
                ),
                BlocBuilder<GetAllUserBloc, GetAllUserState>(
                  builder: (context, state) {
                    return MaterialButton(
                        color: Colors.blueAccent,
                        onPressed: () async {
                          widget.post.post = postController.text;
                          context
                              .read<CreateImagePostBloc>()
                              .add(CreateImagePost(
                                picture: widget.image,
                                post: widget.post,
                              ));
                          Navigator.pop(context);
                          Navigator.pop(context);
                          if(state is GetAllUserSuccess) {
                            context.read<SendPushNotificationBloc>().add(
                                SendPushNotification(

                                    myUsers: state.listUsers, post: widget.post));
                          }
                        },

                        child: const Text(
                          'Post',
                          style: TextStyle(color: Colors.white),
                        ));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
