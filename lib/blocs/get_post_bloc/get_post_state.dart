part of 'get_post_bloc.dart';

abstract class GetPostState extends Equatable {
  const GetPostState();
}

class GetPostInitial extends GetPostState {
  @override
  List<Object> get props => [];
}


class GetPostSuccess extends GetPostState {
  final List<Post> posts;
  const GetPostSuccess({required this.posts});
  @override
  List<Object?> get props => [posts];
}

class GetPostFailure extends GetPostState {
  @override
  List<Object?> get props => [];

}