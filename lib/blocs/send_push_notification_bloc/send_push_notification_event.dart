part of 'send_push_notification_bloc.dart';

sealed class SendPushNotificationEvent extends Equatable {
  const SendPushNotificationEvent();
}

class SendPushNotification extends SendPushNotificationEvent {
  final Post post;
  final List<MyUser?> myUsers;
  const SendPushNotification( {required this.myUsers,required this.post});
  @override
  List<Object?> get props => [post,myUsers];
}
