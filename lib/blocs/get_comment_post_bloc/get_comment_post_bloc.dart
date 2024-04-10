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
  late final StreamSubscription<List<Comment>> _streamSubscription;

  GetCommentPostBloc({required CommentRepository myCommentRepository})
      : _commentRepository = myCommentRepository,
        super(GetCommentPostInitial()) {
    on<GetCommentPostPush>(_onGetCommentPostPush);
    on<GetCommentPostPop>(_onGetCommentPostPop);
  }

  _onGetCommentPostPush(
      GetCommentPostPush event, Emitter<GetCommentPostState> emit)  {
    _streamSubscription =
        _commentRepository.allComment(event.postId).listen((listComments) {
      add(GetCommentPostPop(listComments: listComments));
    });
  }

  _onGetCommentPostPop(
      GetCommentPostPop event, Emitter<GetCommentPostState> emit) {
    emit(GetCommentPostProgress());
    try {
      emit(GetCommentPostSuccess(comment: event.listComments));
    } catch (e) {
      log(e.toString());
      emit(GetCommentPostFailure());
    }
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
