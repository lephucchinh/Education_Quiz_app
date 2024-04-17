import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:comment_repository/comment_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

part 'create_comment_post_event.dart';

part 'create_comment_post_state.dart';

class CreateCommentPostBloc
    extends Bloc<CreateCommentPostEvent, CreateCommentPostState> {
  final CommentRepository _commentRepository;
  final PostRepository _postRepository;

  CreateCommentPostBloc(
      {required CommentRepository myCommentRepository,
      required PostRepository myPostRepository})
      : _commentRepository = myCommentRepository,
        _postRepository = myPostRepository,
        super(CreateCommentPostInitial()) {
    on<CreateComment>(_onCreateComment);
  }

  _onCreateComment(
      CreateComment event, Emitter<CreateCommentPostState> emit) async {
    emit(CreateCommentPostProgress());
    try {
      Comment comment = await _commentRepository.createComment(event.comment);
      await _postRepository.increaseNumberComment(event.comment.postID);
      emit(CreateCommentPostSuccess(comment: comment));
    } catch (e) {
      log(e.toString());
      emit(CreateCommentPostFailure());
    }
  }
}
