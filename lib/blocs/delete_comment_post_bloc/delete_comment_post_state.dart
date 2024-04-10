part of 'delete_comment_post_bloc.dart';

abstract class DeleteCommentPostState extends Equatable {
  const DeleteCommentPostState();
}

class DeleteCommentPostInitial extends DeleteCommentPostState {
  @override
  List<Object> get props => [];
}

class DeleteCommentPostProgress extends DeleteCommentPostState {
  @override
  List<Object?> get props => [];
}

class DeleteCommentPostSuccess extends DeleteCommentPostState {
  @override
  List<Object?> get props => [];

}
class DeleteCommentPostFailure extends DeleteCommentPostState {
  @override
  List<Object?> get props => [];

}