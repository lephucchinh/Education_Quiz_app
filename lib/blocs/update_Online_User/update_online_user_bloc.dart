import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'update_online_user_event.dart';

part 'update_online_user_state.dart';

class UpdateOnlineUserBloc
    extends Bloc<UpdateOnlineUserEvent, UpdateOnlineUserState> {
  final UserRepository _userRepository;

  UpdateOnlineUserBloc({required UserRepository myUserRepository})
      : _userRepository = myUserRepository,
        super(UpdateOnlineUserInitial()) {
    on<UpdateOnlineUser>(_onUpdateOnlineUser);
  }

  _onUpdateOnlineUser(
      UpdateOnlineUser event, Emitter<UpdateOnlineUserState> emit) async {
    emit(UpdateOnlineUserProgress());
    try {
      await _userRepository.updateOnline(event.userId, event.isOnline);
      emit(UpdateOnlineUserSuccess());
    } catch (e) {
      log(e.toString());
      emit(UpdateOnlineUserFailure());
    }
  }
}
