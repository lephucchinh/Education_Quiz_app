import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:comment_repository/comment_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

part 'delete_comment_post_event.dart';

part 'delete_comment_post_state.dart';

class DeleteCommentPostBloc
    extends Bloc<DeleteCommentPostEvent, DeleteCommentPostState> {
  final CommentRepository _commentRepository;
  final PostRepository _postRepository;

  DeleteCommentPostBloc(
      {required CommentRepository myCommentRepository,
      required PostRepository myPostRepository})
      : _commentRepository = myCommentRepository,
        _postRepository = myPostRepository,
        super(DeleteCommentPostInitial()) {
    on<DeleteCommentPost>(_onDeleteCommentPost);
  }

  _onDeleteCommentPost(
      DeleteCommentPost event, Emitter<DeleteCommentPostState> emit) async {
    emit(DeleteCommentPostProgress());
    try {
      await _commentRepository.deleteComment(event.commentID, event.postID);
      await _postRepository.decreaseNumberComment(event.postID);
      emit(DeleteCommentPostSuccess());
    } catch (e) {
      log(e.toString());
      emit(DeleteCommentPostFailure());
    }
  }
}
