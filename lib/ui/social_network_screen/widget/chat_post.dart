import 'package:comment_repository/comment_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:post_repository/post_repository.dart';
import 'package:quizgames/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:quizgames/blocs/create_comment_post_bloc/create_comment_post_bloc.dart';
import 'package:quizgames/blocs/delete_post_bloc/delete_post_bloc.dart';
import 'package:quizgames/blocs/likes_Post/likes_post_bloc.dart';
import 'package:quizgames/ui/social_network_screen/Comment_bottomsheet_screen/widget/commentsUser.dart';
import 'package:user_repository/user_repository.dart';

import '../../../blocs/get_comment_post_bloc/get_comment_post_bloc.dart';
import '../../../blocs/get_post_bloc/get_post_bloc.dart';
import '../Comment_bottomsheet_screen/CommentBottomsheetScreen.dart';

class ChatPost extends StatefulWidget {
  final Post post;
  final MyUser myUser;

  const ChatPost({super.key, required this.post, required this.myUser});

  @override
  State<ChatPost> createState() => _ChatPostState();
}

class _ChatPostState extends State<ChatPost> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(widget.post.myUser.picture!),
                          fit: BoxFit.fill),
                    ),
                  ),
                  title: Text(
                    widget.post.myUser.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  trailing: Visibility(
                    visible:
                        context.read<AuthenticationBloc>().state.user?.uid ==
                            widget.post.myUser.id,
                    child: IconButton(
                      onPressed: () {
                        context.read<DeletePostBloc>().add(DeletePost(
                            postID: widget.post.postID,
                            myId: widget.post.myUser.id));
                      },
                      icon: const Icon(Icons.delete_outline),
                    ),
                  ),
                  subtitle: Text(
                    DateFormat('yyyy-MM-dd').format(widget.post.createAt),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                // color: Colors.amber,
                child: Text(
                  widget.post.post,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (widget.post.likedBy.contains(context
                              .read<AuthenticationBloc>()
                              .state
                              .user
                              ?.uid)) {
                            context.read<LikesPostBloc>().add(UnlikePost(
                                userID: context
                                    .read<AuthenticationBloc>()
                                    .state
                                    .user!
                                    .uid,
                                postID: widget.post.postID));
                          } else {
                            context.read<LikesPostBloc>().add(LikesPost(
                                userID: context
                                    .read<AuthenticationBloc>()
                                    .state
                                    .user!
                                    .uid,
                                postID: widget.post.postID));
                          }
                        },
                        icon: widget.post.likedBy.contains(context
                                .read<AuthenticationBloc>()
                                .state
                                .user
                                ?.uid)
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(Icons.favorite_border),
                      ),
                      IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                isDismissible: true,
                                builder: (BuildContext context) {
                                  return MultiBlocProvider(
                                    providers: [
                                      BlocProvider(
                                        create: (context) =>
                                            CreateCommentPostBloc(
                                                myCommentRepository:
                                                    FirebaseCommentRepository(),
                                                myPostRepository:
                                                    FireBasePostRepository()),
                                      ),
                                      BlocProvider(
                                        create: (context) => GetCommentPostBloc(
                                            myCommentRepository:
                                                FirebaseCommentRepository())
                                          ..add(GetCommentPost(
                                              postId: widget.post.postID)),
                                      ),
                                    ],
                                    child: CommentBottomSheetScreen(
                                      myUser: widget.myUser,
                                      post: widget.post,
                                    ),
                                  );
                                });
                          },
                          icon: const Icon(
                            Icons.messenger_outline,
                          ))
                    ],
                  ),
                  BlocListener<LikesPostBloc, LikesPostState>(
                    listener: (context, state) {
                      if (state is LikesPostSuccess ||
                          state is UnlikePostSuccess) {
                        context.read<GetPostBloc>().add(GetPost());
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('${widget.post.likes} lượt thích.'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('${widget.post.numberComments} bình luận.'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
