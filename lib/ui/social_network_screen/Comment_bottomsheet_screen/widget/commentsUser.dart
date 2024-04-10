import 'package:comment_repository/comment_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quizgames/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:quizgames/blocs/delete_comment_post_bloc/delete_comment_post_bloc.dart';
import 'package:quizgames/blocs/get_comment_post_bloc/get_comment_post_bloc.dart';
import 'package:quizgames/blocs/like_comment_post_bloc/like_comment_post_bloc.dart';
import 'package:quizgames/blocs/like_comment_post_bloc/like_comment_post_bloc.dart';

class CommentsUser extends StatefulWidget {
  final Comment comment;

  const CommentsUser({
    super.key,
    required this.comment,
  });

  @override
  State<CommentsUser> createState() => _CommentsUserState();
}

class _CommentsUserState extends State<CommentsUser> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikeCommentPostBloc, LikeCommentPostState>(
      builder: (context, state) {
        return GestureDetector(
          onLongPress: () {
            if (widget.comment.myUser.id ==
                context.read<AuthenticationBloc>().state.user!.uid) {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: Text('Cảnh báo !'),
                        content: Text('Bạn có muốn xóa comment này ?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                context.read<DeleteCommentPostBloc>().add(
                                    DeleteCommentPost(
                                        commentID: widget.comment.commentID,
                                        postID: widget.comment.postID));
                                Navigator.pop(context);
                              },
                              child: Text('OK')),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel')),
                        ],
                      ));
            }
          },
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            widget.comment.myUser.picture!.isNotEmpty
                                ? Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              widget.comment.myUser.picture!),
                                          fit: BoxFit.fill),
                                    ),
                                  )
                                : Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      widget.comment.myUser.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      DateFormat('yyyy-MM-dd')
                                          .format(widget.comment.createAt),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(widget.comment.comment),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                if (widget.comment.userLikes.contains(context
                                    .read<AuthenticationBloc>()
                                    .state
                                    .user
                                    ?.uid)) {
                                  context.read<LikeCommentPostBloc>().add(
                                      UnlikeCommentPost(
                                          userID: context
                                              .read<AuthenticationBloc>()
                                              .state
                                              .user!
                                              .uid,
                                          postID: widget.comment.postID,
                                          commentID: widget.comment.commentID));
                                } else {
                                  context.read<LikeCommentPostBloc>().add(
                                      LikeCommentPost(
                                          userID: context
                                              .read<AuthenticationBloc>()
                                              .state
                                              .user!
                                              .uid,
                                          postID: widget.comment.postID,
                                          commentID: widget.comment.commentID));
                                }
                              },
                              icon: widget.comment.userLikes.contains(context
                                      .read<AuthenticationBloc>()
                                      .state
                                      .user
                                      ?.uid)
                                  ? const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : const Icon(Icons.favorite_border)),
                          BlocListener<LikeCommentPostBloc,
                              LikeCommentPostState>(
                            listener: (context, state) {
                              if (state is LikeCommentPostSuccess) {
                                widget.comment.userLikes =
                                    state.commentNew.userLikes;
                                widget.comment.numberLikes =
                                    state.commentNew.numberLikes;
                              } else if (state is UnlikeCommentPostSuccess) {
                                widget.comment.userLikes =
                                    state.commentNew.userLikes;
                                widget.comment.numberLikes =
                                    state.commentNew.numberLikes;
                              }
                            },
                            child: Text("${widget.comment.numberLikes}"),
                          ),
                        ],
                      )
                    ],
                  ),
                  Text('0 bình luận'),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
