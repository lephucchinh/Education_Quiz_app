import 'package:comment_repository/comment_repository.dart';

abstract class CommentRepository{
  Future<Comment> createComment (Comment comment);
  Future<List<Comment>> getComment(String postID);
  Future<void> deleteComment(String userID);
  Future<void> likesComment(String commentID , String userID );
  Future<void> unlikesComment(String commentID , String userID );
}