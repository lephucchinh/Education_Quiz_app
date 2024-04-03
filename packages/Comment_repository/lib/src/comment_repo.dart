import 'package:comment_repository/comment_repository.dart';

abstract class CommentRepository {
  Future<Comment> createComment(Comment comment);

  Future<List<Comment>> getComment(String postID);

  Future<void> deleteComment(String userID);

  Future<Comment> likesComment(String commentID, String postID, String userID);

  Future<Comment> unlikesComment(String commentID, String postID, String userID);

}
