part of 'get_comment_post_bloc.dart';

abstract class GetCommentPostEvent extends Equatable {
  const GetCommentPostEvent();
}

class GetCommentPostPush extends GetCommentPostEvent {
  final String postId;

  const GetCommentPostPush({required this.postId});
  @override
  List<Object?> get props => [postId];

}
class GetCommentPostPop extends GetCommentPostEvent {
  final List<Comment> listComments;

  const GetCommentPostPop({required this.listComments});

  @override
  // TODO: implement props
  List<Object?> get props => [listComments];

}

