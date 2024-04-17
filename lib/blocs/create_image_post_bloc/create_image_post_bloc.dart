import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

part 'create_image_post_event.dart';

part 'create_image_post_state.dart';

class CreateImagePostBloc
    extends Bloc<CreateImagePostEvent, CreateImagePostState> {
  final PostRepository _postRepository;

  CreateImagePostBloc({required PostRepository myPostRepository})
      : _postRepository = myPostRepository,
        super(CreateImagePostInitial()) {
    on<CreateImagePost>(_onCreateImagePost);
  }
  _onCreateImagePost(CreateImagePost event , Emitter<CreateImagePostState> emit) async {
    emit(CreateImagePostProgress());
    try {
      await _postRepository.uploadPicture(event.picture, event.post);
      emit(CreateImagePostSuccess());
    } catch (e) {
      log(e.toString());
      emit(CreateImagePostFailure());
    }
  }
}
