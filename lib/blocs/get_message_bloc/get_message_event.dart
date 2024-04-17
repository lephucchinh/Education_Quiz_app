part of 'get_message_bloc.dart';

sealed class GetMessageEvent extends Equatable {
  const GetMessageEvent();
}
class GetMessage extends GetMessageEvent {
  final List<Chat> listChat;

  const GetMessage({required this.listChat});
  @override
  List<Object?> get props => [listChat];
}

class StreamGetMessage extends GetMessageEvent {
  final String chatId;

  const StreamGetMessage({required this.chatId});
  @override
  List<Object?> get props => [chatId];
}