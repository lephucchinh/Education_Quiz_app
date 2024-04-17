part of 'delete_chat_bloc.dart';

sealed class DeleteChatEvent extends Equatable {
  const DeleteChatEvent();
}
class DeleteChat extends DeleteChatEvent {
  final String chatID;
  final DateTime send;

  const DeleteChat({required this.chatID, required this.send});
  @override
  List<Object?> get props => [chatID,send];

}
