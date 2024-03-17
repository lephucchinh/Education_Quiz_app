import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:comment_repository/comment_repository.dart';
import 'package:equatable/equatable.dart';

part 'get_comment_post_event.dart';

part 'get_comment_post_state.dart';

class GetCommentPostBloc
    extends Bloc<GetCommentPostEvent, GetCommentPostState> {
  final CommentRepository _commentRepository;

  GetCommentPostBloc({required CommentRepository myCommentRepository})
      : _commentRepository = myCommentRepository,
        super(GetCommentPostInitial()) {
    on<GetCommentPost>(_onGetCommentPost);
  }
  _onGetCommentPost(GetCommentPost event , Emitter<GetCommentPostState> emit) async {
    emit(GetCommentPostProgress());
    try {
      List<Comment> comment = await _commentRepository.getComment(event.postId);

      emit(GetCommentPostSuccess(comment: comment));
    } catch (e) {
      log(e.toString());
      emit(GetCommentPostFailure());

    }
  }
}
