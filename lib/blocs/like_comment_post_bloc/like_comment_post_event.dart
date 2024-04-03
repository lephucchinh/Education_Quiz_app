part of 'like_comment_post_bloc.dart';

sealed class LikeCommentPostEvent extends Equatable {
  const LikeCommentPostEvent();
}

class LikeCommentPost extends LikeCommentPostEvent {
  final String userID;

  final String postID;

  final String commentID;

  const LikeCommentPost(
      {required this.userID, required this.postID, required this.commentID});

  @override
  List<Object?> get props => [userID, postID, commentID];
}

class UnlikeCommentPost extends LikeCommentPostEvent {
  final String userID;

  final String postID;

  final String commentID;

  const UnlikeCommentPost(
      {required this.userID, required this.postID, required this.commentID});

  @override
  List<Object?> get props => [userID,postID,commentID];

}
