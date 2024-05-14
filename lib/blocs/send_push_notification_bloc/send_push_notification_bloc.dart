import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';
import 'package:user_repository/user_repository.dart';

part 'send_push_notification_event.dart';

part 'send_push_notification_state.dart';

class SendPushNotificationBloc
    extends Bloc<SendPushNotificationEvent, SendPushNotificationState> {
  final PostRepository _postRepository;

  SendPushNotificationBloc({required PostRepository myPostRepository})
      : _postRepository = myPostRepository,
        super(SendPushNotificationInitial()) {
    on<SendPushNotification>(_onSendPushNotification);
  }
  _onSendPushNotification(SendPushNotification event , Emitter<SendPushNotificationState> emit) async {
    emit(SendPushNotificationProgress());

    log("${event.myUsers.toString()}");
    try {
      final String? token = event.post.myUser.token;
      await _postRepository.sendPushNotification(event.myUsers, event.post.myUser.name, token!);
      emit(SendPushNotificationSuccess());
    } catch (e) {
      emit(SendPushNotificationFailure());
    }
  }
}
