import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

part 'get_post_event.dart';

part 'get_post_state.dart';

class GetPostBloc extends Bloc<GetPostEvent, GetPostState> {
  final PostRepository _postRepository;
    StreamSubscription<List<Post>>? _streamPostSubscription;

  GetPostBloc({required PostRepository myPostRepository})
      : _postRepository = myPostRepository,
        super(GetPostInitial()) {

    on<GetPost>(_onGetPost);
    on<StreamGetPost>(_onStreamGetPost);
  }

  _onStreamGetPost(StreamGetPost event , Emitter<GetPostState> emit) {
    _streamPostSubscription = _postRepository.getPost().listen((event) {
      add(GetPost(posts: event));

    });
  }


  _onGetPost(GetPost event, Emitter<GetPostState> emit) async {
    try {
      emit(GetPostSuccess(posts: event.posts));
    } catch (e) {
      log(e.toString());
      emit(GetPostFailure());
    }
  }

  @override
  Future<void> close() {
    _streamPostSubscription!.cancel();
    return super.close();
  }
}
