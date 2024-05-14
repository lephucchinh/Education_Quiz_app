import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:post_repository/post_repository.dart';
import 'package:quizgames/blocs/create_image_post_bloc/create_image_post_bloc.dart';
import 'package:quizgames/blocs/create_post_bloc/create_post_bloc.dart';
import 'package:quizgames/blocs/get_all_user_chat/get_all_user_bloc.dart';
import 'package:quizgames/blocs/get_all_user_chat/get_all_user_bloc.dart';
import 'package:quizgames/blocs/send_push_notification_bloc/send_push_notification_bloc.dart';
import 'package:quizgames/ui/social_network_screen/Post_screen/widget/post_image_screen.dart';
import 'package:user_repository/user_repository.dart';

import '../../../blocs/get_post_bloc/get_post_bloc.dart';

class PostScreen extends StatefulWidget {
  final Post post;
  final MyUser myUser;
  const PostScreen({super.key, required this.post, required this.myUser});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late Post post;
  final postController = TextEditingController();
  bool _buttonEnabled = true;

  @override
  void initState() {
    post = Post.empty;
    post = widget.post;
    post.picture = '';
    post.myUser.picture =  widget.myUser.picture;
    post.type = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocListener<CreatePostBloc, CreatePostState>(
        listener: (context, state) async {
          if (state is CreatePostSuccess) {
            Navigator.pop(context);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).colorScheme.primary,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new)),
            actions: [
              IconButton(
                  onPressed: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.camera);
                    if (image != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => BlocProvider(
                                    create: (context) => CreateImagePostBloc(
                                        myPostRepository:
                                            FireBasePostRepository()),
                                    child: PostImageScreen(
                                      image: image.path,
                                      post: widget.post,
                                    ),
                                  )));
                    }
                    ;
                  },
                  icon: Icon(Icons.camera_alt)),
              IconButton(
                  onPressed: () async {
                    final ImagePicker picker = ImagePicker();
                    final List<XFile?> image =
                        await picker.pickMultiImage(imageQuality: 70);
                    for (var i in image) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => BlocProvider(
                                    create: (context) => CreateImagePostBloc(
                                        myPostRepository:
                                            FireBasePostRepository()),
                                    child: PostImageScreen(
                                      image: i!.path,
                                      post: widget.post,
                                    ),
                                  )));
                    }
                  },
                  icon: Icon(Icons.image)),
            ],
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: size.width * 0.95,
                      child: TextFormField(
                        maxLines: 10,
                        maxLength: 500,
                        controller: postController,
                        decoration: InputDecoration(
                          hintText: "Enter Your Post Here",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BlocBuilder<GetAllUserBloc, GetAllUserState>(
                    builder: (context, state) {
                      return MaterialButton(
                        onPressed: () {
                          if (_buttonEnabled) {
                            if (postController.text.length != 0) {
                              setState(() {
                                _buttonEnabled = false;
                                post.post = postController.text;
                              });
                              context
                                  .read<CreatePostBloc>()
                                  .add(CreatePost(post: post));
                              if(state is GetAllUserSuccess) {
                                context.read<SendPushNotificationBloc>().add(
                                    SendPushNotification(
                                        myUsers: state.listUsers, post: post));
                              }
                            }
                          }
                        },
                        child: const Text('Post'),
                        color: Theme.of(context).colorScheme.primary,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
