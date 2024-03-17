import 'package:comment_repository/comment_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_repository/post_repository.dart';
import 'package:quizgames/blocs/create_comment_post_bloc/create_comment_post_bloc.dart';
import 'package:quizgames/blocs/get_comment_post_bloc/get_comment_post_bloc.dart';
import 'package:quizgames/blocs/get_comment_post_bloc/get_comment_post_bloc.dart';
import 'package:user_repository/user_repository.dart';

import '../../../blocs/get_post_bloc/get_post_bloc.dart';
import 'widget/commentsUser.dart';

class CommentBottomSheetScreen extends StatefulWidget {
  final MyUser myUser;
  final Post post;

  const CommentBottomSheetScreen({
    super.key,
    required this.myUser,
    required this.post,
  });

  @override
  State<CommentBottomSheetScreen> createState() =>
      _CommentBottomSheetScreenState();
}

class _CommentBottomSheetScreenState extends State<CommentBottomSheetScreen> {
  late Comment comment;
  final commentController = TextEditingController();

  @override
  void initState() {
    comment = Comment.empty;
    comment.myUser = widget.myUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<CreateCommentPostBloc, CreateCommentPostState>(
  listener: (context, state) {
    if(state is CreateCommentPostSuccess){
      context.read<GetPostBloc>().add(GetPost());
    }
  },
  child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Container(
              height: 370,
              child: BlocListener<CreateCommentPostBloc, CreateCommentPostState>(
                listener: (context, state) {
                  if (state is CreateCommentPostSuccess) {
                    setState(() {
                      context
                          .read<GetCommentPostBloc>()
                          .add(GetCommentPost(postId: widget.post.postID));
                    });
                  }
                },
                child: BlocBuilder<GetCommentPostBloc, GetCommentPostState>(
                  builder: (context, state) {
                    if (state is GetCommentPostSuccess) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.comment.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CommentsUser(
                            comment: state.comment[index],
                          );
                        },
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      child: TextFormField(
                        controller: commentController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          suffixIcon: MaterialButton(
                              shape: const CircleBorder(),
                              minWidth: 5,
                              height: 5,
                              color: Colors.blue,
                              onPressed: () {
                                if (commentController.text.length != 0) {
                                  setState(() {
                                    comment.postID = widget.post.postID;
                                    comment.comment = commentController.text;
                                  });
                                  context
                                      .read<CreateCommentPostBloc>()
                                      .add(CreateComment(comment: comment));
                                  commentController.text = '';
                                }
                              },
                              child: Icon(
                                Icons.arrow_right,
                                color: Colors.white,
                              )),
                          hintText: 'add comments',
                          labelStyle: TextStyle(
                            fontSize: 20, // Kích thước chữ
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[500]),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
),
    );
  }
}
