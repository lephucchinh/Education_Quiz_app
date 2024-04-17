part of 'create_message_bloc.dart';

sealed class CreateMessageEvent extends Equatable {
  const CreateMessageEvent();
}
class CreateMessage extends CreateMessageEvent {
  final Chat chat;

  const CreateMessage( {required this.chat, });
  @override
  List<Object?> get props => [chat];
}
class CreateImageMessage extends CreateMessageEvent {
  final Chat chat;
  final String image;

  const CreateImageMessage({required this.chat, required this.image});
  @override
  List<Object?> get props => [chat,image];

}