part of 'send_push_notification_bloc.dart';

sealed class SendPushNotificationState extends Equatable {
  const SendPushNotificationState();
}

final class SendPushNotificationInitial extends SendPushNotificationState {
  @override
  List<Object> get props => [];
}
class SendPushNotificationProgress extends SendPushNotificationState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class SendPushNotificationSuccess extends SendPushNotificationState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class SendPushNotificationFailure extends SendPushNotificationState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
