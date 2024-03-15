import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:comment_repository/comment_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'create_comment_post_event.dart';

part 'create_comment_post_state.dart';

class CreateCommentPostBloc
    extends Bloc<CreateCommentPostEvent, CreateCommentPostState> {
  final CommentRepository _commentRepository;

  CreateCommentPostBloc({required CommentRepository myCommentRepository})
      : _commentRepository = myCommentRepository,
        super(CreateCommentPostInitial()) {
    on<CreateComment>(_onCreateComment);

  }

  _onCreateComment(CreateComment event , Emitter<CreateCommentPostState> emit ) async {
    emit(CreateCommentPostProgress());
    try {
      Comment comment = await _commentRepository.createComment(event.comment);
      emit(CreateCommentPostSuccess(comment: comment));
    } catch (e) {
      log(e.toString());
      emit(CreateCommentPostFailure());
    }
  }
}
