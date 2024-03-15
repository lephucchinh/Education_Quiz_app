import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_repository/post_repository.dart';
import 'package:quizgames/blocs/create_post_bloc/create_post_bloc.dart';

import '../../../blocs/get_post_bloc/get_post_bloc.dart';

class PostScreen extends StatefulWidget {
  final Post post;

  const PostScreen({super.key, required this.post});

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
          if (state is CreatePostSuccess)  {
            context.read<GetPostBloc>().add(GetPost());
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
                  MaterialButton(
                    onPressed: () {
                      if(_buttonEnabled){
                        if (postController.text.length != 0) {
                          setState(() {
                            _buttonEnabled = false;
                            post.post = postController.text;
                          });
                          context
                              .read<CreatePostBloc>()
                              .add(CreatePost(post: post));
                        }
                      }
                    },
                    child: const Text('Post'),
                    color: Theme.of(context).colorScheme.primary,
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
