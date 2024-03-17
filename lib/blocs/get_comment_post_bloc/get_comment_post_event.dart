part of 'get_comment_post_bloc.dart';

abstract class GetCommentPostEvent extends Equatable {
  const GetCommentPostEvent();
}

class GetCommentPost extends GetCommentPostEvent {
  final String postId;

  const GetCommentPost({required this.postId});
  @override
  List<Object?> get props => [postId];

}
