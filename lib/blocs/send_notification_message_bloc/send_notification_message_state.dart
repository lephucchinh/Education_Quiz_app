part of 'send_notification_message_bloc.dart';

sealed class SendNotificationMessageState extends Equatable {
  const SendNotificationMessageState();
}

final class SendNotificationMessageInitial extends SendNotificationMessageState {
  @override
  List<Object> get props => [];
}
class SendNotificationMessageProgress extends SendNotificationMessageState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class SendNotificationMessageSuccess extends SendNotificationMessageState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class SendNotificationMessageFailure extends SendNotificationMessageState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}