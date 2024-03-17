import 'package:comment_repository/comment_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(widget.comment.myUser.picture!),
                        fit: BoxFit.fill),
                  ),
                ),
                title: Row(
                  children: [
                    Text(
                      widget.comment.myUser.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      DateFormat('yyyy-MM-dd').format(widget.comment.createAt),
                    ),
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      favorite = !favorite;
                    });
                  },
                  icon: favorite == true
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(Icons.favorite_border),
                ),
                subtitle: Text(widget.comment.comment)),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
