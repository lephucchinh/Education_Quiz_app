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
  Future<Comment> likesComment(
      String commentID, String postID, String userID) async {
    try {
      String commentPath = "$postID/comment_In_Post/$commentID";
      DocumentSnapshot commentSnapshot = await commentCollection.doc(commentPath).get();
      Map<String, dynamic>? commentData = commentSnapshot.data() as Map<String, dynamic>?;
      Comment comment = Comment.fromEntity(CommentEntity.fromDocument(commentData!));

      int like = comment.numberLikes + 1;

      List<String> userLikes = List<String>.from(comment.userLikes);
      userLikes.add(userID);
      await commentCollection
          .doc(postID)
          .collection("comment_In_Post")
          .doc(commentID)
          .update({"numberLikes": like, "userLikes": userLikes});
      Comment commentNew = await commentCollection
          .doc(postID)
          .collection("comment_In_Post")
          .doc(commentID)
          .get()
          .then((value) =>
          Comment.fromEntity(CommentEntity.fromDocument(value.data()!)));
      return commentNew;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  // kinh nghiệm bắt buộc tạo biến phải tuân theo nguyên tắc!!!!!.
  Future<Comment> unlikesComment(
      String commentID, String postID, String userID) async {
    try {
      Comment comment = await commentCollection
          .doc(postID)
          .collection("comment_In_Post")
          .doc(commentID)
          .get()
          .then((value) =>
              Comment.fromEntity(CommentEntity.fromDocument(value.data()!)));
      int like = comment.numberLikes - 1;
      List<String> userLikes = List<String>.from(comment.userLikes);
      userLikes.remove(userID);
      await commentCollection
          .doc(postID)
          .collection("comment_In_Post")
          .doc(commentID)
          .update({"numberLikes": like, "userLikes": userLikes});
      Comment commentNew = await commentCollection
          .doc(postID)
          .collection("comment_In_Post")
          .doc(commentID)
          .get()
          .then((value) =>
          Comment.fromEntity(CommentEntity.fromDocument(value.data()!)));
      return commentNew;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
