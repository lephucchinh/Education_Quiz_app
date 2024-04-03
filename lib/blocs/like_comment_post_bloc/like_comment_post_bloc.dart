import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:comment_repository/comment_repository.dart';
import 'package:equatable/equatable.dart';

part 'like_comment_post_event.dart';

part 'like_comment_post_state.dart';

class LikeCommentPostBloc
    extends Bloc<LikeCommentPostEvent, LikeCommentPostState> {
  final CommentRepository _commentRepository;

  LikeCommentPostBloc({required CommentRepository myCommentRepository})
      : _commentRepository = myCommentRepository,
        super(LikeCommentPostInitial()) {
    on<LikeCommentPost>(_onLikeCommentPost);
    on<UnlikeCommentPost>(_onUnlikeCommentPost);
  }
  _onLikeCommentPost(LikeCommentPost event ,Emitter<LikeCommentPostState> emit) async {
    emit(LikeCommentPostProgress());
    try {
       final Comment commentNew = await _commentRepository.likesComment(event.commentID, event.postID, event.userID);

      emit(LikeCommentPostSuccess(commentNew: commentNew));
    }

    catch (e, s) {
      log(e.toString());
      emit(LikeCommentPostError());
    }
  }
  _onUnlikeCommentPost(UnlikeCommentPost event , Emitter<LikeCommentPostState> emit) async {
    emit(UnlikeCommentPostProgress());
    try {
      final Comment commentNew  = await _commentRepository.unlikesComment(event.commentID, event.postID, event.userID);
      emit(UnlikeCommentPostSuccess(commentNew: commentNew));
    }
    catch (e) {
      log(e.toString());
      emit(UnlikeCommentPostError());
    }
  }
}
