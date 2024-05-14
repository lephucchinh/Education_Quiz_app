part of 'delete_chat_bloc.dart';

sealed class DeleteChatEvent extends Equatable {
  const DeleteChatEvent();
}
class DeleteChat extends DeleteChatEvent {
  final Chat chat;
  final DateTime send;

  const DeleteChat({required this.chat, required this.send});
  @override
  List<Object?> get props => [chat,send];

}
