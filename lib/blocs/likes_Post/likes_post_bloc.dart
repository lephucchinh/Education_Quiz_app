import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

part 'likes_post_event.dart';

part 'likes_post_state.dart';

class LikesPostBloc extends Bloc<LikesPostEvent, LikesPostState> {
  final PostRepository _postRepository;

  LikesPostBloc({required PostRepository myPostRepository})
      : _postRepository = myPostRepository,
        super(LikesPostInitial()) {
    on<LikesPost>(_onLikesPost);
    on<UnlikePost>(_onUnlikePost);
  }

  _onLikesPost(LikesPost event, Emitter<LikesPostState> emit) async {
    emit(LikesPostProgress());
    try {
      await _postRepository.likesPost(event.postID, event.userID);
      emit(LikesPostSuccess());
    } catch (e) {
      log(e.toString());
      emit(LikesPostFailure());
    }

  }

  _onUnlikePost(UnlikePost event, Emitter<LikesPostState> emit) async {
    emit(UnlikePostProgress());
    try {
      await _postRepository.unlikesPost(event.postID, event.userID);
      emit(UnlikePostSuccess());
    } catch (e) {
      log(e.toString());
      emit(UnlikePostFailure());
    }


  }
}
