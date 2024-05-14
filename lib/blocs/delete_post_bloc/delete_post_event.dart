part of 'delete_post_bloc.dart';

abstract class DeletePostEvent extends Equatable {
  const DeletePostEvent();
}

class DeletePost extends DeletePostEvent {
  final Post post;
  final String myId;

  const DeletePost({required this.post, required this.myId});
  @override
  List<Object?> get props => [post,myId];

}