part of 'update_online_user_bloc.dart';

sealed class UpdateOnlineUserEvent extends Equatable {
  const UpdateOnlineUserEvent();
}

class UpdateOnlineUser  extends UpdateOnlineUserEvent {
  final bool isOnline;
  final String userId;

  const UpdateOnlineUser({required this.userId,required this.isOnline});
  @override
  // TODO: implement props
  List<Object?> get props => [isOnline,userId];

}
