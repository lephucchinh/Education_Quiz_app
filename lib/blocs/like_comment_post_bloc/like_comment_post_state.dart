part of 'like_comment_post_bloc.dart';

sealed class LikeCommentPostState extends Equatable {
  const LikeCommentPostState();
}

final class LikeCommentPostInitial extends LikeCommentPostState {
  @override
  List<Object> get props => [];
}

class LikeCommentPostProgress extends LikeCommentPostState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LikeCommentPostSuccess extends LikeCommentPostState {

  final Comment commentNew;

  const LikeCommentPostSuccess({required this.commentNew});
  @override
  List<Object?> get props => [commentNew];
}

class LikeCommentPostError extends LikeCommentPostState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UnlikeCommentPostProgress extends LikeCommentPostState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class UnlikeCommentPostSuccess extends LikeCommentPostState {

  final Comment commentNew;

  const UnlikeCommentPostSuccess({required this.commentNew});
  @override
  // TODO: implement props
  List<Object?> get props => [commentNew];

}

class UnlikeCommentPostError extends LikeCommentPostState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}