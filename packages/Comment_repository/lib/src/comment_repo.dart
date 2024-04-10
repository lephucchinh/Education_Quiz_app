import 'package:comment_repository/comment_repository.dart';

abstract class CommentRepository {
  Future<Comment> createComment(Comment comment);

  Stream<List<Comment>> allComment(String postID);

  Future<void> deleteComment(String commentID,String postID);

  Future<Comment> likesComment(String commentID, String postID, String userID);

  Future<Comment> unlikesComment(String commentID, String postID, String userID);

}
