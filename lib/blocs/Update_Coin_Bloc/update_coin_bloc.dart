import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quizgames/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:user_repository/user_repository.dart';

part 'update_coin_event.dart';

part 'update_coin_state.dart';

class UpdateCoinBloc extends Bloc<UpdateCoinEvent, UpdateCoinState> {
  final UserRepository _userRepository;

  UpdateCoinBloc( {required UserRepository userRepository})
      : _userRepository = userRepository,
        super(UpdateCoinInitial()) {
    on<UpdateCoins>(_onUpdateCoins);
  }

  late int updateCoin;
  _onUpdateCoins(UpdateCoins event , Emitter<UpdateCoinState> emit) async {
    emit(UploadCoinProcess());
    try {
      MyUser myUser = await _userRepository.getMyUser(event.userId);
      updateCoin = int.parse(myUser.coin!) + event.score;
      String coin = await _userRepository.uploadCoins(updateCoin.toString(), event.userId);
      emit(UploadCoinSuccess(coin: coin));
    } catch (e) {
      log(e.toString());
      emit(UploadCoinError());
    }
  }

}
