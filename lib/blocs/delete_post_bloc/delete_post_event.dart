part of 'delete_post_bloc.dart';

abstract class DeletePostEvent extends Equatable {
  const DeletePostEvent();
}

class DeletePost extends DeletePostEvent {
  final String userID;
  final String myId;

  const DeletePost({required this.userID, required this.myId});
  @override
  List<Object?> get props => [userID,myId];

}