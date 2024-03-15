part of 'likes_post_bloc.dart';

abstract class LikesPostState extends Equatable {
  const LikesPostState();
}

class LikesPostInitial extends LikesPostState {
  @override
  List<Object> get props => [];
}

class LikesPostProgress extends LikesPostState {
  @override
  List<Object?> get props => [];
}

class LikesPostSuccess extends LikesPostState {
  @override
  List<Object?> get props => [];
}

class LikesPostFailure extends LikesPostState {
  @override
  List<Object?> get props => [];
}



class UnlikePostProgress extends LikesPostState {
  @override
  List<Object?> get props => [];
}

class UnlikePostSuccess extends LikesPostState {
  @override
  List<Object?> get props => [];
}

class UnlikePostFailure extends LikesPostState {
  @override
  List<Object?> get props => [];
}
