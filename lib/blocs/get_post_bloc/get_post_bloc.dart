import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

part 'get_post_event.dart';

part 'get_post_state.dart';

class GetPostBloc extends Bloc<GetPostEvent, GetPostState> {
  final PostRepository _postRepository;

  GetPostBloc({required PostRepository myPostRepository})
      : _postRepository = myPostRepository,
        super(GetPostInitial()) {
    on<GetPost>(_onGetPost);
  }

  _onGetPost(GetPost event, Emitter<GetPostState> emit) async {
    try {
      List<Post> posts = await _postRepository.getPost();
      emit(GetPostSuccess(posts: posts));
    } catch (e) {
      log(e.toString());
      emit(GetPostFailure());
    }
  }
}
