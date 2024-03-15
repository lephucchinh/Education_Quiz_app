part of 'create_post_bloc.dart';

abstract class CreatePostEvent extends Equatable {
  const CreatePostEvent();
}

class CreatePost extends CreatePostEvent {
  final Post post;

  const CreatePost({required this.post});

  @override
  List<Object?> get props => [post];

}
