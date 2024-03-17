import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comment_repository/comment_repository.dart';
import 'package:comment_repository/src/comment_repo.dart';
import 'package:comment_repository/src/models/comment.dart';
import 'package:uuid/uuid.dart';

class FirebaseCommentRepository implements CommentRepository {
  final commentCollection = FirebaseFirestore.instance.collection("Comments");

  @override
  Future<Comment> createComment(Comment comment) async {
    try {
      comment.commentID = const Uuid().v1();
      comment.createAt = DateTime.now();
      await commentCollection
          .doc(comment.postID)
          .collection("comment_In_Post")
          .doc(comment.commentID)
          .set(comment.toEntity().toDocument());

      return comment;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Comment>> getComment(String postID) async {
    try {
      return await commentCollection
          .doc(postID)
          .collection("comment_In_Post")
          .orderBy('createAt', descending: true)
          .get()
          .then((value) => value.docs
              .map((e) =>
                  Comment.fromEntity(CommentEntity.fromDocument(e.data())))
              .toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> deleteComment(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<void> likesComment(String commentID, String userID) {
    // TODO: implement likesComment
    throw UnimplementedError();
  }

  @override
  Future<void> unlikesComment(String commentID, String userID) {
    // TODO: implement unlikesComment
    throw UnimplementedError();
  }

}
