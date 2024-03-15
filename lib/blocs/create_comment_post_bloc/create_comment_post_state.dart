part of 'create_comment_post_bloc.dart';

abstract class CreateCommentPostState extends Equatable {
  const CreateCommentPostState();
}

class CreateCommentPostInitial extends CreateCommentPostState {
  @override
  List<Object> get props => [];
}

class CreateCommentPostSuccess extends CreateCommentPostState {
  final Comment comment;

  const CreateCommentPostSuccess({required this.comment});

  @override
  List<Object?> get props => [comment];
}
class CreateCommentPostProgress extends CreateCommentPostState {
  @override
  List<Object?> get props => [];
}
class CreateCommentPostFailure extends CreateCommentPostState {
  @override
  List<Object?> get props => [];
}
