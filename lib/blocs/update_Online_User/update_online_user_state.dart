part of 'update_online_user_bloc.dart';

sealed class UpdateOnlineUserState extends Equatable {
  const UpdateOnlineUserState();
}

final class UpdateOnlineUserInitial extends UpdateOnlineUserState {
  @override
  List<Object> get props => [];
}
class UpdateOnlineUserProgress extends UpdateOnlineUserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class UpdateOnlineUserSuccess extends UpdateOnlineUserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class UpdateOnlineUserFailure extends UpdateOnlineUserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}