part of 'get_post_bloc.dart';

abstract class GetPostEvent extends Equatable {
  const GetPostEvent();
}
class StreamGetPost extends GetPostEvent {
  @override
  List<Object?> get props => [];

}
class GetPost extends GetPostEvent {
  final List<Post> posts;

  const GetPost({required this.posts});
  @override
  List<Object?> get props => [posts];

}