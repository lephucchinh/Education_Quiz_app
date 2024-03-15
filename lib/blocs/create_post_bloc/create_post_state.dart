part of 'create_post_bloc.dart';

abstract class CreatePostState extends Equatable {
  const CreatePostState();
}

class CreatePostInitial extends CreatePostState {
  @override
  List<Object> get props => [];
}

class CreatePostProgress extends CreatePostState {
  @override
  List<Object?> get props => [];
}

class CreatePostSuccess extends CreatePostState {
  final Post post;

  const CreatePostSuccess({required this.post});
  @override
  List<Object?> get props => [post];
}

class CreatePostFailure extends CreatePostState {
  @override
  List<Object?> get props => [];

}
