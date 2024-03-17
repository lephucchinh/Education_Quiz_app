import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_comment_post_event.dart';
part 'delete_comment_post_state.dart';

class DeleteCommentPostBloc extends Bloc<DeleteCommentPostEvent, DeleteCommentPostState> {
  DeleteCommentPostBloc() : super(DeleteCommentPostInitial()) {
    on<DeleteCommentPostEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
