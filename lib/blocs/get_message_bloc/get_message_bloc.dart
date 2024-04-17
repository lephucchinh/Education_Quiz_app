import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:equatable/equatable.dart';

part 'get_message_event.dart';

part 'get_message_state.dart';

class GetMessageBloc extends Bloc<GetMessageEvent, GetMessageState> {
  final ChatRepository _chatRepository;
  StreamSubscription<List<Chat>>? chatSubscription;

  GetMessageBloc({required ChatRepository myChatRepository})
      : _chatRepository = myChatRepository,
        super(GetMessageInitial()) {

    on<GetMessage>(_onGetMessage);
    on<StreamGetMessage>(_onStreamGetMessage);
  }
  _onStreamGetMessage(StreamGetMessage event , Emitter<GetMessageState> emit) {
    chatSubscription = _chatRepository.getChat(event.chatId).listen((event) {
      add(GetMessage(listChat: event));
    });
  }
  _onGetMessage(GetMessage event , Emitter<GetMessageState> emit) async {
    try {
      emit(GetMessageSuccess(listChat: event.listChat));
    } catch (e) {
      log(e.toString());
      emit(GetMessageFailure());
    }
  }
  @override
  Future<void> close() {
    chatSubscription!.cancel();
    return super.close();
  }
}
