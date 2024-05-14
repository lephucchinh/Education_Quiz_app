import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:comment_repository/comment_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

part 'delete_post_event.dart';

part 'delete_post_state.dart';

class DeletePostBloc extends Bloc<DeletePostEvent, DeletePostState> {
  final PostRepository _postRepository;

  DeletePostBloc(
      {required PostRepository myPostRepository,})
      : _postRepository = myPostRepository,

        super(DeletePostInitial()) {
    on<DeletePost>(_onDeletePost);
  }

  _onDeletePost(DeletePost event, Emitter<DeletePostState> emit) async {
    emit(DeletePostProgress());
    try {
      await _postRepository.deletePost(event.post);
      emit(DeletePostSuccess());
    } catch (e) {
      log(e.toString());
      emit(DeletePostFailure());
    }
  }
}
