import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'get_all_user_event.dart';

part 'get_all_user_state.dart';

class GetAllUserBloc extends Bloc<GetAllUserEvent, GetAllUserState> {
  final UserRepository _userRepository;
  late final StreamSubscription<List<MyUser>> _userSubscription;

  GetAllUserBloc({required UserRepository myUserRepository})
      : _userRepository = myUserRepository,
        super(GetAllUserInitial()) {


    _userSubscription = _userRepository.allUsers.listen((event) {
      add(GetAllUser(listUsers: event));
    });

    on<GetAllUser>(_onGetAllUser);
  }
  _onGetAllUser(GetAllUser event , Emitter<GetAllUserState> emit)  {
    emit(GetAllUserProgress());
    try {
        emit(GetAllUserSuccess(listUsers: event.listUsers));
    } catch (e) {
      log(e.toString());
      emit(GetAllUserFailure());
    }
  }


  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
