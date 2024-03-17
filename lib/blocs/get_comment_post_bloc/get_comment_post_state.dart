part of 'get_comment_post_bloc.dart';

abstract class GetCommentPostState extends Equatable {
  const GetCommentPostState();
}

class GetCommentPostInitial extends GetCommentPostState {
  @override
  List<Object> get props => [];
}

class GetCommentPostProgress extends GetCommentPostState {
  @override
  List<Object?> get props => [];

}
class GetCommentPostSuccess extends GetCommentPostState {
  final List<Comment> comment;

  const GetCommentPostSuccess({required this.comment});
  @override
  List<Object?> get props => [comment];

}
class GetCommentPostFailure extends GetCommentPostState {
  @override
  List<Object?> get props => [];

}