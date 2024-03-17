part of 'delete_post_bloc.dart';

abstract class DeletePostEvent extends Equatable {
  const DeletePostEvent();
}

class DeletePost extends DeletePostEvent {
  final String postID;
  final String myId;

  const DeletePost({required this.postID, required this.myId});
  @override
  List<Object?> get props => [postID,myId];

}