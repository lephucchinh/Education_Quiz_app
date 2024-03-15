import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

part 'create_post_event.dart';

part 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  final PostRepository _postRepository;

  CreatePostBloc({required PostRepository myPostRepository})
      : _postRepository = myPostRepository,
        super(CreatePostInitial()) {
    on<CreatePost>(_onCreatePost);
  }
  _onCreatePost (CreatePost event , Emitter<CreatePostState> emit) async {
    emit(CreatePostProgress());
    try {
       Post post = await _postRepository.createPost(event.post);
      emit(CreatePostSuccess(post: post));
    }
    catch (e) {
      log(e.toString());
      emit(CreatePostFailure());
    }
  }
}
