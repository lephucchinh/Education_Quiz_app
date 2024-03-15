part of 'likes_post_bloc.dart';

abstract class LikesPostEvent extends Equatable {
  const LikesPostEvent();
}

class LikesPost extends LikesPostEvent {
  final String postID;
  final String userID;

  const LikesPost( {required this.userID,required this.postID});
  @override
  List<Object?> get props => [postID,userID];

}

class UnlikePost extends LikesPostEvent {
  final String postID;
  final String userID;

  const UnlikePost({required this.postID, required this.userID});

  @override
  List<Object?> get props => [postID,userID];

}


