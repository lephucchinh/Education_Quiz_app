part of 'delete_comment_post_bloc.dart';

abstract class DeleteCommentPostEvent extends Equatable {
  const DeleteCommentPostEvent();
}

class DeleteCommentPost extends DeleteCommentPostEvent {
  final String commentID;
  final String postID;

  const DeleteCommentPost({required this.commentID, required this.postID});

  @override
  List<Object?> get props => [commentID,postID];

}
