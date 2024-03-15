part of 'create_comment_post_bloc.dart';

abstract class CreateCommentPostEvent extends Equatable {
  const CreateCommentPostEvent();
}

class CreateComment extends CreateCommentPostEvent {
  final Comment comment;

  const CreateComment({required this.comment});



  @override
  List<Object?> get props => [comment];

}
