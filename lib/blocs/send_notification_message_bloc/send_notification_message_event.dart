part of 'send_notification_message_bloc.dart';

sealed class SendNotificationMessageEvent extends Equatable {
  const SendNotificationMessageEvent();
}

class SendNotificationMessage extends SendNotificationMessageEvent {
  final String token;
  final Chat chat;
  final String name;

  const SendNotificationMessage(
      {required this.name, required this.token, required this.chat});

  @override
  List<Object?> get props => [name,chat, token];
}
