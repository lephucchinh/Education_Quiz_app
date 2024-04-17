import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:equatable/equatable.dart';

part 'create_message_event.dart';

part 'create_message_state.dart';

class CreateMessageBloc extends Bloc<CreateMessageEvent, CreateMessageState> {
  final ChatRepository _chatRepository;

  CreateMessageBloc({required ChatRepository myChatRepository})
      : _chatRepository = myChatRepository,
        super(CreateMessageInitial()) {
    on<CreateMessage>(_onCreateMessage);
    on<CreateImageMessage>(_onCreateImageMessage);
  }

  _onCreateMessage(CreateMessage event, Emitter<CreateMessageState> emit) {
    emit(CreateMessageProgress());
    try {
      event.chat.userSendID.hashCode >= event.chat.userReceiveID.hashCode
          ? event.chat.chatID = "${event.chat.userSendID}_${event.chat.userReceiveID}"
          : event.chat.chatID = "${event.chat.userReceiveID}_${event.chat.userSendID}";
      _chatRepository.createChat(event.chat);
      emit(CreateMessageSuccess());
    } catch (e) {
      log(e.toString());
      emit(CreateMessageFailure());
    }
  }

  _onCreateImageMessage(CreateImageMessage event , Emitter<CreateMessageState> emit) async {
    emit(CreateMessageProgress());
    try {
      event.chat.userSendID.hashCode >= event.chat.userReceiveID.hashCode
          ? event.chat.chatID = "${event.chat.userSendID}_${event.chat.userReceiveID}"
          : event.chat.chatID = "${event.chat.userReceiveID}_${event.chat.userSendID}";
      await _chatRepository.updateChatImage(event.image, event.chat);
      emit(CreateMessageSuccess());
    } catch (e) {
      log(e.toString());
      emit(CreateMessageFailure());
    }
  }
}
