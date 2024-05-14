import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:equatable/equatable.dart';

part 'send_notification_message_event.dart';

part 'send_notification_message_state.dart';

class SendNotificationMessageBloc
    extends Bloc<SendNotificationMessageEvent, SendNotificationMessageState> {
  final ChatRepository _chatRepository;

  SendNotificationMessageBloc({required ChatRepository myChatRepository})
      : _chatRepository = myChatRepository,
        super(SendNotificationMessageInitial()) {
    on<SendNotificationMessage>(_onSendNotificationMessage);
  }
  _onSendNotificationMessage(SendNotificationMessage event , Emitter<SendNotificationMessageState> emit) async {
    emit(SendNotificationMessageProgress());
    try {

      await _chatRepository.sendNotificationChat(event.token, event.chat.chat!,event.name,event.chat.type!);
      emit(SendNotificationMessageSuccess());
    } catch (e) {
      log(e.toString());
      emit(SendNotificationMessageFailure());
    }
  }
}
