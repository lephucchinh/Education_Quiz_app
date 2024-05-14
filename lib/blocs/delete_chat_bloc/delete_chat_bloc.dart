import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:equatable/equatable.dart';

part 'delete_chat_event.dart';

part 'delete_chat_state.dart';

class DeleteChatBloc extends Bloc<DeleteChatEvent, DeleteChatState> {
  final ChatRepository _chatRepository;

  DeleteChatBloc({required ChatRepository myChatRepository})
      : _chatRepository = myChatRepository,
        super(DeleteChatInitial()) {
    on<DeleteChat>(_onDeleteChat);
  }
  _onDeleteChat(DeleteChat event , Emitter<DeleteChatState> emit) async {
    emit(DeleteChatProgress());
    try {
      await _chatRepository.deleteChat(event.chat, event.send);
      emit(DeleteChatSuccess());
    } catch (e) {
      log(e.toString());
      emit(DeleteChatFailure());
    }
  }
}
