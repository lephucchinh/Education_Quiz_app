import 'package:comment_repository/comment_repository.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

import 'widget/commentsUser.dart';

class CommentBottomSheetScreen extends StatefulWidget {
  final MyUser myUser;

  const CommentBottomSheetScreen({
    super.key, required this.myUser,
  });

  @override
  State<CommentBottomSheetScreen> createState() => _CommentBottomSheetScreenState();
}

class _CommentBottomSheetScreenState extends State<CommentBottomSheetScreen> {
  late Comment comment;
  @override
  void initState() {
    comment = Comment.empty;
    comment.myUser = widget.myUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430,
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20))
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return CommentsUser();
              },
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(),
        ],
      ),
    );
  }
}